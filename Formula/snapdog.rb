class Snapdog < Formula
  desc "Multi-zone audio controller with AirPlay, Snapcast, MQTT, and KNX"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.11.2"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.11.2/snapdog-v0.11.2-x86_64-apple-darwin.tar.gz"
      sha256 "616e680a9070e0e530670cedbb0ed33a175348769c9b81c519417869c2606ca8"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.11.2/snapdog-v0.11.2-aarch64-apple-darwin.tar.gz"
      sha256 "7e5b24f68e57d49f5ab821fa8cb8ca93a146a6e4b2a2e7c407ef67247bd77932"
    end
  end

  def install
    bin.install "snapdog"
  end
end
