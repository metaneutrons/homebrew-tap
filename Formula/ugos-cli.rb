class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.5.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.5.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "7ab0b90c1b5f3b24b500c0ce0de025ec8579b6039322a4772f13cad789e286fe"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.5.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "6ec5bac867815cc046c3eb1ce951739692e5c09d8713749386cb86bf751198d8"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.5.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4b2720dc9e8fbd8c1382b1096eead483d2bb58608013e0d01e06c6c2a8433d54"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.5.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "786302fd998d2e04a11f59d699ee48e81dbcb54fa89941828f5433e982adcbbd"
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
