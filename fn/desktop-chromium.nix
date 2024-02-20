params:
(import ./desktop-exec.nix)
  "chromium"
  (import ../apps/chromium.nix ++ params)
