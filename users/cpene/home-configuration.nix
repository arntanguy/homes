{
  inputs,
  ...
}:
{
  imports = [
    inputs.self.homeModules.laas
    inputs.self.homeModules.ros
  ];

  config = {
    programs.starship.enable = true;
  };
}
