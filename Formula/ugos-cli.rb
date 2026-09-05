class UgosCli < Formula
  desc "CLI and MCP server for UGREEN NAS (UGOS) management"
  homepage "https://github.com/metaneutrons/ugos-cli"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.12.0/ugos-cli-x86_64-apple-darwin.tar.gz"
      sha256 "691fedbba326ffb48cfff604dc740db35525dfa4e7e85da25e04bcabf7e4e40d"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.12.0/ugos-cli-aarch64-apple-darwin.tar.gz"
      sha256 "e5077018f9ee209096db645a909d468bb5532880b1e144f3fbf6cc7d2a481d30"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.12.0/ugos-cli-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9c6f782bdff9bde9790ed04412b9fd3c962250988dabbaed434331ccd98cdf2f"
    else
      url "https://github.com/metaneutrons/ugos-cli/releases/download/v0.12.0/ugos-cli-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "842c4302ee38b95a79f8aed09cb78f16aa7c6657db34f350737fd8fc743e6a9a"
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
