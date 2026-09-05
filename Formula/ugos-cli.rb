class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "c87f721f83ae4456b09c231e6fbbee0f30da87aae97955eed6d84d23ed4f9b01"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "bb35a1251c9d5e2dc03d2a591691eccde0ef26d4d0ff787d43ae9fabf7b090c2"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fb5777fc86d2eb060ee3985a4bc435505dacb9ee349195d7c3fe5ffe54cbd7c0"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.13.2/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2c4045deef979d59040558143203bc09140ffc8df9a298ed72b001fedc4554f"
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
