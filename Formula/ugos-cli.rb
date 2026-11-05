class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.17.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "34516cc0f5937eddd467792461ecefbba3c8f29960dc02c4676ecb1d370fa380"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.17.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "877696c17d78a7ee9c3ed6d3b6cc17ed674f1fd7f3e0b048a2451af81754501c"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.17.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e11e0aa5ea11ebc5e8884c462cfa362a2564b4890acc5478de02180bd2761078"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.17.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b76374a89670af990b4cd8c1068c9b598aa497d23f7a94f96074572749daf674"
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
