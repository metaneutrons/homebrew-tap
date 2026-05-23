class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.12.4"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.4/snapdog-v0.12.4-x86_64-apple-darwin.tar.gz"
      sha256 "58a4ba71bf04c5f2a617efc4850366c2ab8a25260b5494b139badc691331b82b"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.4/snapdog-v0.12.4-aarch64-apple-darwin.tar.gz"
      sha256 "d21454c22e1efd38bbee6e1939821298706d75f1a232beb729c36e6747512c10"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
