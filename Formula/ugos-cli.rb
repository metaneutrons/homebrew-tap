class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "36c05dc5f984cca64ce0e0b41e0cdb0d196c7c341c6f09d0d535985ef54625a1"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d20e7a991a706f97fc93687036bfcf2c5f7e234617968368f34a6f38b890b4bb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f7f4036de6b02a94c3dbb6fb6e6bb609abfb14240e1467d80681b01358100664"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da60abeae311adbc5ca94e8bfcbd4089e13e143e1f442637e1078521e71595c1"
    end
  end

  def install
    bin.install "ugos-cli"
    bin.install "ugos-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ugos-cli --version")
  end
end
