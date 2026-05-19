class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.11.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.11.3/snapdog-v0.11.3-x86_64-apple-darwin.tar.gz"
      sha256 "27f51ea540ca1903786229c08a69e04bbb6dd65c6e72d82dc4d1042626427853"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.11.3/snapdog-v0.11.3-aarch64-apple-darwin.tar.gz"
      sha256 "16c5f791ffcf8de401227b12f86036d1eb708bf0533793bbabecb8763aa97d93"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
