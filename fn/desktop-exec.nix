app:
params:
builtins.toString (
  [ "/run/current-system/sw/bin/${app}" ]
  ++ params
)
