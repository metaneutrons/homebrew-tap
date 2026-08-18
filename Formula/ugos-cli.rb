class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.6.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.6.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "762795a9c490e81a935662a3125d959894b8de87734fd24551181d96337ef093"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.6.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "e9f4481e89f3f087d21479b8102661f34707781528791e341a264a7d9eb58e52"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.6.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54d480422594240d4c97f3f394a1dc74966ccf1bdaafc57b68ea7735c07638cc"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.6.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "05d606cf01f919112e1673032f6977bdc6986ef9940449cae837dc396d34d748"
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
