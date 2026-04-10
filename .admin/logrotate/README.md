# Logrotate

Copy files for all services you have running.

```sh
export PATH_TO_ROOT=/full/path/to/homelab/repository

cat traefik | envsubst | sudo tee /etc/logrotate.d/traefik
```
