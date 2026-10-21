# Filebrowser

## First launch

Before first launch, temporarily enable user creation

```yml
# config.yaml
auth:
  methods:
    oidc:
      createUser: true
```

After successful authorization with the OIDC provider, disable user creation and restart Filebrowser

```yml
# config.yaml
auth:
  methods:
    oidc:
      createUser: false
```

```sh
docker restart filebrowser
```
