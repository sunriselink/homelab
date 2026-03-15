# Filebrowser

## First launch

Before first launch, temporarily enable user creation

```yml
# filebrowser/config.yaml
auth:
  methods:
    oidc:
      createUser: true
```

After successful authorization with the Authelia provider, disable user creation and restart Filebrowser

```yml
# filebrowser/config.yaml
auth:
  methods:
    oidc:
      createUser: false
```

```sh
./compose.sh filebrowser down
./compose.sh filebrowser up -d
```
