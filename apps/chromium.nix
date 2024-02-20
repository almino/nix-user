# https://nixos.wiki/wiki/Chromium#Enabling_native_Wayland_support
# In earlier versions you can enable wayland support by setting the appropriate command-line flags:
# nixpkgs.config.chromium.commandLineArgs = "--enable-features=UseOzonePlatform --ozone-platform=wayland";
[
  # https://askubuntu.com/a/295650/63408
  "--ash-host-window-bounds"
  # "--disable-default-apps"
  "--enable-features=UseOzonePlatform"
  "--force-device-scale-factor=1.20"
  "--ozone-platform=wayland"
]
# VA-API is enabled by default now in Chromium. Check chrome://gpu if it is working and if VA is detected. You may need to enable Hardware-accelerated video decode in chrome://flags.
# chrome://gpu/
# chrome://settings/system
