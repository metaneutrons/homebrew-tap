class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.1/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "03e85e231c9d9f1e8ed97814adafd3f822811e4c2a9e6dab735ba31d5ae5278f"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.1/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "b80df860ce6d70cde59b9e9a956c75fab66c050763da045cc8bdbfaa1a166563"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.1/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "25d21a08b4925166d9d22b4ff757e2de7ca6afa6bc8bb2b5d6d74d3d062ba522"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.11.1/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "efcf1ffee84b202a69c1564e357a5f681bbf68e5698d3b4c771d38c95096eac3"
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
