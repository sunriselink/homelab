# Authelia

## First launch

Before first launch, create a user database file.

```yml
# authelia/users.yml

# yaml-language-server: $schema=https://www.authelia.com/schemas/latest/json-schema/user-database.json

users:
  <username>:
    displayname: <user display name>
    email: <user e-mail>
    password: <password hash>
    groups:
      - admins
```

To generate a password hash, run the command:

```sh
docker run -it --rm <authelia_image> authelia crypto hash generate argon2
```

If values ​​in the `NAS_UID` and `NAS_GID` environment variables do not match the current user's data, you need to change file permissions.

```sh
chmod 660 authelia/users.yml

sudo chown <NAS_UID>:<NAS_GID> authelia/users.yml
```

For more information, read the [instructions](https://www.authelia.com/reference/guides/passwords/).
