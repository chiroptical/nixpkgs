# Expression generated by update.sh; do not edit it by hand!
{ stdenv, callPackage, ... }@args:

callPackage ./make-brave.nix (removeAttrs args [ "callPackage" ])
  (
    if stdenv.isAarch64 then
      {
        pname = "brave";
        version = "1.66.118";
        url = "https://github.com/brave/brave-browser/releases/download/v1.66.118/brave-browser_1.66.118_arm64.deb";
        hash = "sha256-H2f6i86lDToHEkJ9JZCBp3tlpnI+zoFHY3YzLdp5lE4=";
        platform = "aarch64-linux";
      }
    else if stdenv.isx86_64 then
      {
        pname = "brave";
        version = "1.66.118";
        url = "https://github.com/brave/brave-browser/releases/download/v1.66.118/brave-browser_1.66.118_amd64.deb";
        hash = "sha256-r7lpEOxECOqJ23XxTHqSy6KhyNPRwOkuJvnZUuuBN4k=";
        platform = "x86_64-linux";
      }
    else
      throw "Unsupported platform."
  )
