params:
(import ./desktop-exec.nix)
  "google-chrome-stable"
  (import ../apps/chromium.nix ++ params)
