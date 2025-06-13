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
