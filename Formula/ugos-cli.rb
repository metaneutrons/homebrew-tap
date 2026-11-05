class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.16.1/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6386d28197ee65da76ca86a5d56f5041eb9d2a65e8574745c17665d668d15c08"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.16.1/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "4cac69b2e6599ab75c1a4bd89ae34b9e379269ce91f61d5420204dc65b925272"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.16.1/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "24ceb8efef3046a2c4c25a022b54d74d6439681caab4f4ed4193baab1bd4dbb4"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.16.1/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1f6c1304cbc15468a03738c0d604facaeaf7e23614b5ae6cce072f803d76fdf9"
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
