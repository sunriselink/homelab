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

## Open ID Connect with Authelia

> Original: [OIDC Authentication](https://docs.immich.app/administration/oauth/)

Configuration of OAuth in Immich System Settings

| Setting                            | Value                                                             |
| ---------------------------------- | ----------------------------------------------------------------- |
| Issuer URL                         | `https://authelia.{ROOT_DOMAIN}/.well-known/openid-configuration` |
| Client ID                          | Copy from `authelia/secrets/immich/client_id`                     |
| Client Secret                      | Copy from `authelia/secrets/immich/client_secret`                 |
| Token Endpoint Auth Method         | `client_secret_post`                                              |
| Scope                              | `openid email profile`                                            |
| ID Token Signed Response Algorithm | `RS256`                                                           |
| Userinfo Signed Response Algorithm | `RS256`                                                           |
| Storage Label Claim                | `uid`                                                             |
| Default Storage Quota (GiB)        | `0` (empty for unlimited quota)                                   |
| Button Text                        | `Sign in with Authelia`                                           |
| Auto Register                      | Disabled                                                          |
| Auto Launch                        | Disabled                                                          |
| Mobile Redirect URI Override       | Disabled                                                          |

After correct login - disable default password authentication:

- OAuth > Auto Launch: Enabled
- Password Login > Login with email and password: Disabled

## Upgrade

> https://immich.app/docs/install/upgrading

You can see versions that had breaking changes [here](https://github.com/immich-app/immich/discussions?discussions_q=label%3Achangelog%3Abreaking-change+sort%3Adate_created).

To compare the contents of the recommended files, run script

```sh
# example
./immich/versions-diff.sh v1.134.0 v1.135.3
```
