class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  version "0.3.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "edcd3ae32e34f9db0bac28482badc6e6e87b797df2aee68899c79df688883aa0"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "5575e5039f815195217e214185505c7ef8b51ac2bd3f0547a3e6993aac08ef5f"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "367e3d32a7b7a1b61e676a8055a51e982935cf0c906af9a043f0adf8f82e5b62"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.3.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c1c243c7023fb8327d5abdc9b65c85461ebf5305312cc44df59be1b4895accdf"
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
