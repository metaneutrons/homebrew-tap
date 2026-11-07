class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.20.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "1dce2f4951d183f2f9e598b891527bf84ce9842a2e811068aa6e326b83d87613"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.20.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "ed511c9e9f8e0a1c9f9f1565dd682958520bec0452ac537d0cf2d8bcbcd5ae80"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.20.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3628ed11f6a075864d9334a33cd284267e1077e9ef657110871e238b4f331b4"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.20.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "772a78d8626bc54fb1da7fbd6574316f24587f2c951dca75d2d5d7ec60389bc4"
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
