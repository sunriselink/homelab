# Nextcloud

## Execute `occ` tasks

```sh
./exec.sh occ [params]
```

## Cron job

```sh
sudo crontab -e

# Every 5 minutes
*/5 * * * * docker exec nextcloud php cron.php
```

## Move user files to another drive

By default, Nextcloud does not have an option to put only user files on a separate disk. The `/var/www/html/data` directory contains service files in addition to user files (logs, cache, etc.). It is also impossible to remap the path beforehand, because Nextcloud will treat it as an error for a new user (see https://github.com/nextcloud/server/issues/21144).

To migrate files correctly, follow the steps below:

1. Comment out the `extends` section in `docker-compose.yml` if it is the first run
2. Start Nextcloud and create a user. A directory with data `./data/data/username` should appear
3. Stop Nextcloud
4. Create a `files-mapping.yml` file with the following contents (or add a new entry in the `volumes` section)

```yml
services:
  files-mapping:
    volumes:
      - ${PATH_TO_FILES:?}/nextcloud/username:/var/www/html/data/username
```

5. Uncomment the `extends` section in `docker-compose.yml`
6. Move the user files folder to a new location

```sh
# For example PATH_TO_FILES=/mnt/data/files
sudo mv ./data/data/username/ /mnt/data/files/nextcloud/
```

7. Start Nextcloud
