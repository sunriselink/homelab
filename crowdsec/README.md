# Crowdsec

## Crowdsec hub autoupdate

```sh
sudo crontab -e

0 0 * * * docker exec crowdsec sh -c "cscli hub update && cscli hub upgrade"
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
