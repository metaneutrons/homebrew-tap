class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.1/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "68fd1f59b91f4f51929f5211ff15c911177b982b2da636fa414e6123da4f05a9"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.1/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "d435cee5c4a3aa7334169882243277bc8a91d0a960965435b13a5a97a82f4c6e"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.1/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "930ab7244ea988502d6f4f9ad771641b388ac6f70f8abb057b0ee7a9f6b471a2"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.14.1/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "12b8d6889e34e48d0504d354d25a469f24878e04498eb3c04df49b51ae2c1f18"
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
