class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.9.2"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.9.2/snapdog-v0.9.2-x86_64-apple-darwin.tar.gz"
      sha256 "ec5d31ea39c6b31b0113106a8209576bd33e99710f76d2e03ba47b90fd4b461f"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.9.2/snapdog-v0.9.2-aarch64-apple-darwin.tar.gz"
      sha256 "d0ad3c2543410193df5b172e3dd5dbfc260d6b56482d8a0860a3ce5a50690fd6"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
