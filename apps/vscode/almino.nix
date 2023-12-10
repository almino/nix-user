# /nix-config/base/vscode/update-extensions.sh > /nix-config/base/vscode/all_extensions.$(now).nix
[
  {
    # https://pkief.gallery.vsassets.io/_apis/public/gallery/publisher/danielshow/extension/autoenv/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    name = "autoenv";
    publisher = "danielshow";
    version = "1.0.3";
    sha256 =
      "6f367f6df419ab346cc09ea5816e5a05564dfeb02a62cee1c4b6d669826b0901";
  }
  {
    name = "copilot";
    publisher = "GitHub";
    version = "1.114.427";
    sha256 = "1mqkgw4ndz622n350kc19x7f9a3q1ffv0307adhr7jav4qcg825g";
  }
  {
    # nix-prefetch-url 'https://pkief.gallery.vsassets.io/_apis/public/gallery/publisher/GitHub/extension/copilot-chat/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage'
    # GitHub.copilot-chat
    name = "copilot-chat";
    publisher = "GitHub";
    version = "0.7.1";
    sha256 = "sha256-GI5mRWu8YtJfT1uYpw27auIqUihj8/eh3go3HTJnvVM=";
  }
  {
    # https://pkief.gallery.vsassets.io/_apis/public/gallery/publisher/vsls-contrib/extension/gistfs/latest/assetbyname/Microsoft.VisualStudio.Services.VSIXPackage
    name = "gistfs";
    publisher = "vsls-contrib";
    version = "0.4.1";
    sha256 =
      "6ede62cf9e6ee38141896757038498059c5b127722c8e6c4dd61e40fe8700119";
  }
  {
    name = "vscode-nginx-conf";
    publisher = "ahmadalli";
    version = "0.3.2";
    sha256 = "042wvrd1jz3wfq1v4n4zr49fzigcwba95zqxi454w9njdgzqi5d4";
  }
  {
    name = "nginx-log-highlighter";
    publisher = "jakebathman";
    version = "1.1.0";
    sha256 = "0jrg6l06lyhini6yafhqh98w3xr29pin8r2j5qbzlmvwzing4g2y";
  }
  {
    name = "prettier-sql-vscode";
    publisher = "inferrinizzard";
    version = "1.6.0";
    sha256 = "1d4vf3gh2x4ycf8ppvvb5d6rsg2ayckd05rkp3w1kw5gxgzmzalp";
  }
]
