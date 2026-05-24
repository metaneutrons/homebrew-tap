class Snapdog < Formula
  desc "Multi-zone audio controller with AirPlay, Snapcast, MQTT, and KNX"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.14.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.14.0/snapdog-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "32329f698139c50f120d6e4668c0ece85d8b5deb23420110f7f5f3b35f038959"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.14.0/snapdog-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "73899ca3e610586116966ce15f818f155fd4fb3d3448707840ce1c1f7709ccfb"
    end
  end

  def install
    bin.install "snapdog"
  end
end
