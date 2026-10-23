# Zerobyte

## Open ID Connect with Authelia

> Original: [SSO](https://zerobyte.app/docs/guides/oidc-sso)

Settings > Organization > Single Sign-On > Register new

| Field                                     | Value                                                             |
| ----------------------------------------- | ----------------------------------------------------------------- |
| Provider ID                               | `authelia`                                                        |
| Organization Domain                       | `{ROOT_DOMAIN}`                                                   |
| Issuer URL                                | `https://authelia.{ROOT_DOMAIN}`                                  |
| Discovery Endpoint                        | `https://authelia.{ROOT_DOMAIN}/.well-known/openid-configuration` |
| Client ID                                 | Copy from `authelia/secrets/zerobyte/client_id`                   |
| Client Secret                             | Copy from `authelia/secrets/zerobyte/client_secret`               |
| Link matching emails to existing accounts | `true`                                                            |

After correct login - disable default password authentication:

Settings > Instance > Enable password login: `false`

## Apprise integration

Notifications > Create destination

| Field             | Value                                                              |
| ----------------- | ------------------------------------------------------------------ |
| Type              | Generic Webhook                                                    |
| Webhook URL       | http://apprise:8000/notify/{APPRISE_CONFIG_KEY}?tags={APPRISE_TAG} |
| Method            | POST                                                               |
| Content Type      | application/json                                                   |
| Use JSON Template | `true`                                                             |
| Title Key         | `title`                                                            |
| Message Key       | `body`                                                             |

For example

```
Webhook URL: http://apprise:8000/notify/apprise?tags=alerts
```
