class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.16.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.16.1/snapdog-v0.16.1-x86_64-apple-darwin.tar.gz"
      sha256 "1f3309501abadeb32373da3ecbae2e7ee0e6342379096563b5289e4b69e5e03f"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.16.1/snapdog-v0.16.1-aarch64-apple-darwin.tar.gz"
      sha256 "e704b83bf908d43f3c43329a4e12d230add6298918c27f9b4de63c030364522c"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
