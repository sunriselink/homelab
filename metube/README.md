# MeTube

## Passing additional options to `yt-dlp`

Additional parameters are specified in `metube/config/presets.json` file. It will be automatically created after first launch, if not exist.

Example

```json
{
  "Proxy": {
    "proxy": "socks5://<username>:<password>@<host or ip>:<port>"
  }
}
```

Additional links:

- https://github.com/alexta69/metube?tab=readme-ov-file#presets
- https://github.com/yt-dlp/yt-dlp?tab=readme-ov-file#usage-and-options
