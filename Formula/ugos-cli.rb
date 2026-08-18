class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.9.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.9.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "6eec8ccb10220f5e765158e434ea39d1a993f65e3fcbc6ee398dee509889494a"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.9.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "9c896bc8215b653310466e7ae00a669dcc6c255ae5e695090c1b4bd3d91a1e25"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.9.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "341600b2bf98e126428ab405dec8e50ffc27abf67d63a740f30c76b0471ba8c2"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.9.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "40a0345bf0277a3ff6c1a1e7301994ea57d8625bf836fbd21e0dbeab736ab154"
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
