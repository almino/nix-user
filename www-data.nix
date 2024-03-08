{ ... }:

let webGroup = "www-data"; in
{
  # É bom tem um grupo para todas as coisas web
  users.groups.${webGroup}.gid = 33;

  users.users.almino.extraGroups = [
    webGroup
  ];
}
