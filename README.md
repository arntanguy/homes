# homes

This include [home-manager](https://github.com/nix-community/home-manager/) configurations for LAAS members.

## Organisation

- `users` have a `home` configuration, and can use `modules/home`
- `hosts` have a `system` configuration, and can use `modules/system`

## Setup

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

```
nix run git+https://gitlab.laas.fr/pi2/homes
```


<details>
<summary>

### Graphical acceleration on Linux (EGL/CUDA/… issues): click here

</summary>

> [!warning]
> This require sudo access

```
nix run git+https://gitlab.laas.fr/pi2/homes#system
```

For extra nightmare, nvidia gang members also need to specify `nvidiaDriverVersion` for their host:
follow the example in `hosts/kurai`, and if you get a new hash put it in `modules/nixos/nvidia-hashes.json`.

</details>
