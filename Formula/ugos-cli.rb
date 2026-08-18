class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.8.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.8.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "f2274522a42cc7a9ac81fba50e5d909833c28964ba2ac7018af0e6e24efc35d1"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.8.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "c6b06c2dab635591d61a5c819235824adcc9d73e7504cca6bd9a806baa4acd74"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.8.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "662487dbaa6b080d6664ca3b1c2bb1ab0be6cd911266a5903a3243bfc3ea9551"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.8.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f905b358035cbd897d926cb4a5df832414ac4f9b926f927501fcfeeafcb1b70f"
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
