# Audiobookshelf

## Open ID Connect with Authelia

> Original: [OIDC Authentication](https://www.audiobookshelf.org/guides/oidc_authentication/)

Navigate to `Settings -> Authentication`, then select the check box for `OpenID Connect Authentication`.

| Field                        | Value                                                           |
| ---------------------------- | --------------------------------------------------------------- |
| Issuer URL                   | `https://authelia.{ROOT_DOMAIN}` (Click "Auth-populate" button) |
| Authorize URL                | `https://authelia.{ROOT_DOMAIN}/api/oidc/authorization`         |
| Token URL                    | `https://authelia.{ROOT_DOMAIN}/api/oidc/token`                 |
| Userinfo URL                 | `https://authelia.{ROOT_DOMAIN}/api/oidc/userinfo`              |
| JWKS URL                     | `https://authelia.{ROOT_DOMAIN}/jwks.json`                      |
| Logout URL                   | Empty                                                           |
| Client ID                    | Copy from `authelia/secrets/audiobookshelf/client_id`           |
| Client Secret                | Copy from `authelia/secrets/audiobookshelf/client_secret`       |
| Signing Algorithm            | `RS256`                                                         |
| Allowed Mobile Redirect URIs | `audiobookshelf://oauth`, `lissen://oauth`                      |
| Subfolder for Redirect URLs  | `None`                                                          |
| Button Text                  | `Login with Authelia`                                           |
| Match existing users by      | `Match by username`                                             |
| Auto Launch                  | Disabled                                                        |
| Auto Register                | Disabled                                                        |

Then restart server.

```sh
docker restart audiobookshelf
```

After correct login - disable default password authentication.

Navigate to `Settings -> Authentication`:

- Password Authentication: Disabled
- OpenID Connect Authentication > Auto Launch: Enabled

Restart server again.
