class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.16.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "3a5d31f4bb8f4ba5d8b6cd70d0e44b71ae14e15e1bed27e2541b242dfdeba492"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.16.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "409f155bebc7973ca8d9a3a2243da7ae2f89215620fd25d7c51344bf09ee5fe4"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.16.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "33768f9d92ba2d7edb8a5d476e9d7ff6b74d28317c09c35f2098fe5022039968"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.16.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a353f978290cf7195df49469f17c4e4a131ff93515bc9924a70fca877ccbac28"
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
