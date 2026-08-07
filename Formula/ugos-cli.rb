class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.3.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.1/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "fea9dfadc0a8caf4541c58582ba8dfeeb2f82e4b49c116501c9530258367ef2d"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.1/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "5555280db7aa64bb52f3d8cc7eeb6c71c3ad039af942ee50b0f68431e8928612"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.1/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "aebf2a9e87dca98b65a322d3d5966b5ed80e930577a9d2ac3f57d1cd528e12dc"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.1/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "00758e40a5a5a3cc2a721780f882844da1e2d12a82860b5b37f4a266b651b662"
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
