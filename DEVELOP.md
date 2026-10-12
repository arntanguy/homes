# Development

First, get `home-manager` and `system-manager` executables available:

```
direnv allow # or `nix develop` if you don't have direnv
```

## Home development

> [!warning]
> This will be overriden daily by `autoUpgrade`

```
home-manager switch -b hmback --flake .
```

## System development

> [!warning]
> This will be overriden daily by `autoUpgrade`

```
system-manager switch --sudo --flake .
```
