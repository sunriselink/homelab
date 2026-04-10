# Crowdsec

## Enroll Security Engine

After spawning up the CrowdSec container, we have to enroll it to our CrowdSec cloud account as security engine. To do so, visit the [CrowdSec homepage](https://app.crowdsec.net) below and register your account.

```sh
docker exec crowdsec cscli console enroll <key>
```

Then head back to CrowdSec's web console and approve the new security engine added to your cloud account. After that restart container.

```sh
docker restart crowdsec
```

## Crowdsec hub autoupdate

```sh
sudo crontab -e

0 5 * * * docker exec crowdsec sh -c "cscli hub update && cscli hub upgrade"
```

## CLI commands

```sh
# Fetch metrics from a Local API server and display them
docker exec crowdsec cscli metrics

# List decisions from Local API
docker exec crowdsec cscli decisions list

# Manual block
docker exec crowdsec cscli decisions add --ip <ip>

# Remove block
docker exec crowdsec cscli decisions delete --ip <ip>

# List all installed configurations
docker exec crowdsec cscli hub list

# List alerts
docker exec crowdsec cscli alerts list

# Show info about an alert
docker exec crowdsec cscli alerts inspect -d <ALERT ID>
```
