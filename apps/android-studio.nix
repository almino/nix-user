{ pkgs, ... }:

{
  # environment.variables.ANDROID_SDK_ROOT = "${pkgs.androidenv.androidPkgs}/libexec/android-sdk";

  nixpkgs.config.android_sdk.accept_license = true;

  programs.adb.enable = true;

  services.udev.extraRules =
    let
      # nix-shell -p usbutils --run "lsusb"
      idVendorRealme = "22d9";
      idProductRealme = "276c";
      idVendorTablet = "2717";
      idProductTablet = "ff48";
    in
    ''
      SUBSYSTEM=="usb", ATTR{idVendor}=="${idVendorRealme}", MODE="[]", GROUP="adbusers", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTR{idVendor}=="${idVendorRealme}", ATTR{idProduct}=="${idProductRealme}", SYMLINK+="android_adb"
      SUBSYSTEM=="usb", ATTR{idVendor}=="${idVendorRealme}", ATTR{idProduct}=="${idProductRealme}", SYMLINK+="android_fastboot"
      SUBSYSTEM=="usb", ATTR{idVendor}=="${idVendorTablet}", MODE="[]", GROUP="adbusers", TAG+="uaccess"
      SUBSYSTEM=="usb", ATTR{idVendor}=="${idVendorTablet}", ATTR{idProduct}=="${idProductTablet}", SYMLINK+="android_adb"
      SUBSYSTEM=="usb", ATTR{idVendor}=="${idVendorTablet}", ATTR{idProduct}=="${idProductTablet}", SYMLINK+="android_fastboot"
    '';

  users.users.almino = {
    extraGroups = [ "adbusers" "kvm" ];
    packages = with pkgs; [
      android-studio
      # android-tools # https://github.com/NixOS/nixpkgs/blob/1c6e20d41d6a9c1d737945962160e8571df55daa/nixos/modules/programs/adb.nix#L29C17-L29C31
      # androidenv.androidPkgs.androidsdk
      gradle
      gradle-completion
      jdk21
    ];
  };
}
