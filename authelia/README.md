# Authelia

## First launch

Before first launch, create a `users.yml` database file.

```yml
# yaml-language-server: $schema=https://www.authelia.com/schemas/latest/json-schema/user-database.json

users:
  <username>:
    displayname: <user display name>
    email: <user e-mail>
    password: <password hash>
    groups:
      - admins
```

To generate a password hash, run the command:

```sh
./authelia-cli.sh crypto hash generate argon2
```

For more information, read the [instructions](https://www.authelia.com/reference/guides/passwords/).

## Testing "init" script

```bash
./compose.sh authelia run --rm init test
```
