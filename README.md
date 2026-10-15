# homes

This include [home-manager](https://nix-community.github.io/home-manager/) and [system-manager](https://system-manager.net/main/) nix configurations for LAAS users and hosts.

## Organisation

- `users` have a `home` configuration, and can use `modules/home/*`
  - a `default` user is **not yet** available: you need your directory in `users/*` and/or `hosts/.../users/*`
- `hosts` have a `system` configuration, and can use `modules/system/*`
  - a `default` system is available for simple cases

## Setup

To setup your home and/or your system, you can follow [SETUP.md](./SETUP.md)

You also need to make sure that your are not using the on-demand prime profile. You can check with `prime-select query`. If it does not return `nvidia`, then run

```
sudo prime-select nvidia
```

## Development

If you want to modify and test this project, you can follow [DEVELOP.md](./DEVELOP.md)
