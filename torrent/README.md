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

## Prowlarr

### Settings

**Indexers > Add Indexer Proxy > FlareSolverr**

| Property | Value                       |
| -------- | --------------------------- |
| Name     | `FlareSolverr`              |
| Tags     | `flaresolverr`              |
| Host     | `http://flaresolverr:8191/` |

**Download Clients > Add Download Client > qBittorrent**

| Property | Value         |
| -------- | ------------- |
| Name     | `qBittorrent` |
| Host     | `qbittorrent` |
| Port     | `8080`        |
| Username | `<username>`  |
| Password | `<password>`  |

### Using FlareSolverr

**Indexers > Add Indexer > Select some indexer**

| Property | Value          |
| -------- | -------------- |
| Tags     | `flaresolverr` |
