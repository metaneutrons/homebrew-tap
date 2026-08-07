class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.3.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.3/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "5030a527a7bdf4dee708bc4eb61826c258b06018dc167cdf521b3e0db01e06aa"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.3/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "33d92debc9e0fa0531743abcda3cbab8387f75e124270fa4614ba4844238413a"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.3/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9dfe1a46e501d23fb87715ba0e37921d7e199b64f4282c99898cd9b1b27d3d5b"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.3/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "426029fff95b6ad3e9f0206fc784e8dcd1aa580cbffebdccd273bb6620d377ff"
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
