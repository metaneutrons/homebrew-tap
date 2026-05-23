class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.13.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.13.0/snapdog-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "7dca17c4abd96401be90e12d5bb823d4eadea056347867aa6ae097a647e47fb8"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.13.0/snapdog-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "9421bd7a47086fd19bf98dead2cf0a6abe912c37919e0e520b93a146e5ead5cf"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
