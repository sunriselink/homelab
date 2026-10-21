#!/bin/sh

set -e

users_file="./users.yml"
data_dir="./data"
secrets_dir="./secrets"

if [ "$1" = "test" ]; then
    users_file="./users_test.yml"
    data_dir="./data_test"
    secrets_dir="./secrets_test"
fi

main() {
    if [ ! -e $users_file ]; then
        echo "ERROR: The $users_file file does not exist."
        exit 1
    elif [ -d $users_file ]; then
        echo "ERROR: The $users_file file was not created. Due to Docker mount behavior, a directory named $users_file was created instead."
        echo "Please remove the $users_file directory, create the $users_file file according to the instructions in README, and recreate the stack."
        exit 1
    elif [ -f $users_file ]; then
        set_permissions -m 660 $users_file
    fi

    create_dirs \
        $data_dir \
        $secrets_dir \
        ./redis

    create_rand_secret_file session_secret
    create_rand_secret_file storage_encryption_key
    create_rand_secret_file hmac_secret

    create_keys

    create_oidc_files audiobookshelf
    create_oidc_files filebrowser
    create_oidc_files immich
    create_oidc_files wud
}

create_dirs() {
    install -d -o ${PUID:?} -g ${PGID:?} -m 770 $@
}

set_permissions() {
    local permissions="440"

    if [ "$1" = "-m" ]; then
        permissions="$2"
        shift 2
    fi

    chown ${PUID:?}:${PGID:?} $@
    chmod $permissions $@
}

create_rand_secret_file() {
    local file="$secrets_dir/$1"

    if [ ! -f "$file" ]; then
        authelia crypto rand --length 64 --charset alphanumeric --file $file
    fi

    set_permissions $file
}

create_keys() {
    local private_key="$secrets_dir/private.pem"
    local public_key="$secrets_dir/public.pem"
    local cert="$secrets_dir/public.crt"

    if [ ! -f "$private_key" ] || [ ! -f "$public_key" ]; then
        authelia crypto pair rsa generate -d $secrets_dir
    fi

    if [ ! -f "$cert" ]; then
        authelia crypto certificate rsa generate -n ${ROOT_DOMAIN:?} -d $secrets_dir --duration 100y
    fi

    set_permissions $private_key $public_key $cert
}

create_oidc_files() {
    local app_dir="$secrets_dir/$1"
    local client_id="$app_dir/client_id"
    local client_secret="$app_dir/client_secret"
    local client_secret_digest="$app_dir/client_secret_digest"

    create_dirs $app_dir

    if [ ! -f "$client_id" ]; then
        authelia crypto rand --length 72 --charset rfc3986 --file $client_id
    fi

    if [ ! -f "$client_secret" ] || [ ! -f "$client_secret_digest" ]; then
        local output=$(authelia crypto hash generate pbkdf2 --variant sha512 --random --random.length 72 --random.charset rfc3986)
        local password=$(echo "$output" | grep "^Random Password:" | cut -d' ' -f3)
        local digest=$(echo "$output" | grep "^Digest:" | cut -d' ' -f2)

        echo $password > $client_secret
        echo $digest > $client_secret_digest
    fi

    set_permissions $client_id $client_secret $client_secret_digest
}

main "$@"
