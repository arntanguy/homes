# homes

This include [home-manager](https://nix-community.github.io/home-manager/) and [system-manager](https://system-manager.net/main/) nix configurations for LAAS users and hosts.

## Organisation

- `users` have a `home` configuration, and can use `modules/home`
- `hosts` have a `system` configuration, and can use `modules/system`

## Pre-requisite

<details>
<summary>

### If you don't already have nix: click here

</summary>

#### Linux, géré par sysadmin

```
sudo salt-call state.apply states.nix
sudo usermod -aG nix-users $(whoami)
```

#### Ubuntu/Debian autogéré

```
sudo apt install -y nix-setup-systemd
echo 'experimental-features = nix-command flakes' | sudo tee -a /etc/nix/nix.conf
sudo usermod -aG nix-users $(whoami)
```

#### Autre Linux / Mac OS

installez curl & git, puis:

```
curl -sSfL https://artifacts.nixos.org/nix-installer | sh -s -- install --enable-flakes
```

</details>

## Home setup

```
nix run git+https://gitlab.laas.fr/pi2/homes#home
```

## System setup

> [!warning]
> This require sudo access

> [!note]
> This is only required for:
> - Graphical acceleration on Linux (eg. EGL/CUDA/… issues)
> - Packages which require elevated priveleges (eg. electron sandbox)

```
nix run git+https://gitlab.laas.fr/pi2/homes#system
```

For extra nightmare, nvidia gang members also need to specify `nvidiaDriverVersion` for their host:
follow the example in `hosts/kurai`, get yours with `nvidia-smi`,
and if you get a new hash put it in `modules/nixos/nvidia-hashes.json`.
