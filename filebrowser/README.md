# Filebrowser

## First launch

Before first launch, temporarily enable user creation

```yml
# ./config.tpl.yaml
auth:
  methods:
    oidc:
      createUser: true
```

After successful authorization with the OIDC provider, disable user creation and recreate Filebrowser stack

```yml
# config.tpl.yaml
auth:
  methods:
    oidc:
      createUser: false
```

```sh
./compose.sh filebrowser up -d --force-recreate
```
