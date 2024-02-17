{ stdenv, fetchurl }:

# TODO: How to deal with OTP versions
let
  fetch_erlang_language_platform = args: fetchurl {
    name = "erlang-language-platform-${args.version}";
    url =
      let
        os = args.os.${stdenv.hostPlatform.system};
        arch = args.arch.${stdenv.hostPlatform.system};
        ident = args.ident.${stdenv.hostPlatform.system};
      in
        "https://github.com/WhatsApp/erlang-language-platform/releases/download/${args.version}/elp-${os}-${arch}-${ident}-otp-25.3.tar.gz";
    sha256 = args.shas.${stdenv.hostPlatform.system};
    meta = { inherit (args) version; };
  };
in
fetch_erlang_language_platform {
  version = "2024-02-16";
  shas = {
    x86_64-linux = "sha256-0000000000000000000000000000000000000000000=";
    aarch64-linux = "sha256-0000000000000000000000000000000000000000000=";
    x86_64-darwin = "sha256-0000000000000000000000000000000000000000000=";
    aarch64-darwin = "sha256-0000000000000000000000000000000000000000000=";
  };
  os = {
    x86_64-linux = "linux";
    aarch64-linux = "linux";
    x86_64-darwin = "macos";
    aarch64-darwin = "macos";
  };
  arch = {
    x86_64-linux = "x86_64";
    aarch64-linux = "aarch64";
    x86_64-darwin = "x86_64";
    aarch64-darwin = "aarch64";
  };
  ident = {
    x86_64-linux = "unknown-linux-gnu";
    aarch64-linux = "unknown-linux-gnu";
    x86_64-darwin = "apple-darwin";
    aarch64-darwin = "apple-darwin";
  };
}
