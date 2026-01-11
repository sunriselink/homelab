# Monitoring

## Grafana

### Default user

```
Username: admin
Password: admin
```

## Docker daemon metrics

To configure the Docker daemon as a Prometheus target, you need to specify the metrics-address in the `daemon.json` configuration file. If the file doesn't exist, create it.

```sh
sudo nano /etc/docker/daemon.json
```

Add the following configuration:

```json
{
  "metrics-addr": "0.0.0.0:9323"
}
```

Restart Docker.

```sh
sudo service docker restart
```
