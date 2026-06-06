# Zerobyte

## Apprise integration

Notifications > Create destination

```
Type: Generic Webhook
Webhook URL: http://apprise:8000/notify/{CONFIG_KEY}?tags={TAG}
Method: POST
Content Type: application/json
Use JSON Template: checked
Title Key: title
Message Key: body
```

For example

```
Webhook URL: http://apprise:8000/notify/apprise?tags=alerts
```
