# Apprise

## Initial Setup

To configure Apprise, you must temporarily disable the configuration lock.

1. Set the environment variable:

```yaml
APPRISE_CONFIG_LOCK: no
```

2. Start the container.

```sh
./compose.sh apprise up -d
```

3. Go to `https://apprise.{ROOT_DOMAIN}` and configure Apprise as required.
4. Set the variable back to:

```yaml
APPRISE_CONFIG_LOCK: yes
```

5. Recreate the container.

```sh
./compose.sh apprise up -d --force-recreate
```

## Example Configuration

Docs: https://appriseit.com/

```yaml
urls:
  - tgram://{bot_token}/{chat_id}:
      tag: 1:alerts

  - mailtos://{username}:{password}@{domain}:
      to: {to_email}
      name: {sender_name}
      tag: 2:alerts

  - savetodisk://:
      tag: 3:alerts
```

## Custom Provider

`savetodisk://` is a custom notification provider that saves incoming messages to the `notifications` directory.

## Tags and Priority

The tag format is:

```
{priority}:{tag}
```

Example:

```yaml
tag: 1:alerts
```

The numeric prefix defines the delivery priority. If a notification provider is unavailable, the next provider with the same tag and the next priority number will be used.

## Configuration Key

By default, the Apprise configuration is stored under the key `apprise`.

If the configuration is recreated through the web interface, the key may change to a custom value. When integrating Apprise with other services, make sure the correct configuration key is used in notification settings.
