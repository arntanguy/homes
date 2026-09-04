# homes

This include [home-manager](https://github.com/nix-community/home-manager/) configurations for LAAS members.

## Setup

<details>
<summary>

### If you don't already have nix, click here

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
nix run home-manager -- switch -b hmback --flake git+https://gitlab.laas.fr/pi2/homes
```
