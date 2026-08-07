class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.3.2"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.2/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "c23e03f04a0a1cf5a948c81d2ada5d3ad89407208131151b2b49d0f98346057a"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.2/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "de168fe3e40b5bd71834f6c239a786e059b77654292a44c58711dcb2fab45334"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.2/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5fbc69058800be180628981c8bdb93b058ba0fd26f5e34f61053db5009732e7c"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.2/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f23baf640a23af27640159aab6de0f933313c70cd4777511b9d133ca8ee82429"
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
