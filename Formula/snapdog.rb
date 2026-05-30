class Snapdog < Formula
  desc "Multi-zone audio controller with AirPlay, Snapcast, MQTT, and KNX"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.16.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.16.0/snapdog-v0.16.0-x86_64-apple-darwin.tar.gz"
      sha256 "c7f7101c5052d9929d366258f43ad639e4be7f2f5fad2e455e72458533faf107"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.16.0/snapdog-v0.16.0-aarch64-apple-darwin.tar.gz"
      sha256 "3e7ee4039fdddcb4a282a4c39221ac7042ba57f51420c0f098377537049d4c1c"
    end
  end

  def install
    bin.install "snapdog"
  end
end
