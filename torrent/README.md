# Torrent stack

## qBittorrent

### Default user

```
Username: admin
Password: <view container logs>
```

### Settings

1. WebUI > Use alternative WebUI: checked
2. WebUI > Files location: `/vuetorrent`
3. Downloads > Run external program on torrent added

```bash
/scripts/torrent_added.sh %N
```

4. Downloads > Run external program on torrent finished

```bash
/scripts/torrent_finished.sh %N
```
