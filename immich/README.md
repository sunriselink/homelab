# Immich

## External storage

1. Comment out the `extends` section in `docker-compose.yml` if it is the first run
2. Create an `external-storage.yml` file with the following contents (or add a new entry in the `volumes` section)

```yml
services:
  external-storage:
    volumes:
      - ${PATH_TO_FILES:?}/nextcloud/username/files:/mnt/media/nextcloud/username:ro
```

3. Uncomment the `extends` section in `docker-compose.yml`
4. Start Immich
5. Add your library following the [instruction](https://immich.app/docs/features/libraries)

## Upgrade

> https://immich.app/docs/install/upgrading

You can see versions that had breaking changes [here](https://github.com/immich-app/immich/discussions?discussions_q=label%3Achangelog%3Abreaking-change+sort%3Adate_created).

To compare the contents of the recommended files, run script

```sh
# example
./versions-diff.sh v1.134.0 v1.135.3
```

> https://github.com/immich-app/immich/releases
