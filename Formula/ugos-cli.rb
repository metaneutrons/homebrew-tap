class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.4.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.4.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "d643c1afd877e6bc4a84743b9f57d905784db1487250398722055df2963f0dc1"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.4.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "bc17b6fc9da86351790cd07ebb1b59bf5ddc8b371559395e0defb7aa3e2178b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.4.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "648562f712d1cd08747fb280bc483403c566cfa5dcf7439d6738a54d88538481"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.4.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7fde8f269a54987b7aec0c514e148f6ca612a4ba604bd914c420c9a0a4accde0"
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
