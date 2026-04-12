class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.2.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.2.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "2c176c783bad6cf136f75bb5d9c378f6d0f5087c64c139ea20b36e3092f903ce"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.2.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "98c7aba267772db7e37e6d28e2aa6846c3b536fb19729d3e65050fac59ad7c9d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.2.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "458b21a5dcdc360586d317974eb84d0dee618bb77e4299a4f67f9050cab2d20e"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.2.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "063ac0a2412324ea30bdd4c963dd14946f107310d0576cd90584d0abbd509a32"
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
