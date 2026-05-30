class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.16.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.16.0/snapdog-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "c653a2a7ff4de934f14864547b7898deae6f71ad360f96c506075acbb5b626b8"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.16.0/snapdog-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "376042e561d371c14450079988dcf2188485e99c83d086e2672c2888e4b5536e"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
