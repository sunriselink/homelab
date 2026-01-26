## Send notifications to Telegram about power events

Copy files

| File                   | Destination           |
| ---------------------- | --------------------- |
| `power-events.env`     | `/etc/default`        |
| `power-events.service` | `/etc/systemd/system` |
| `power-events.sh`      | `/usr/local/bin`      |

Fill variables in `/etc/default/power-events.env` file

Change permissions

```sh
sudo chmod 600 /etc/default/power-events.env
sudo chmod 700 /usr/local/bin/power-events.sh
```

Enable the service

```sh
sudo systemctl daemon-reload
sudo systemctl enable power-events.service
sudo systemctl start power-events.service
```
