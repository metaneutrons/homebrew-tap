class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.12.2"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.2/snapdog-v0.12.2-x86_64-apple-darwin.tar.gz"
      sha256 "b4b9f07deb4f6c369a395e6ff06e77dfdad7965bf2589bb69bf1c62649f21da7"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.2/snapdog-v0.12.2-aarch64-apple-darwin.tar.gz"
      sha256 "d9d0b08aaf7717a616d4591cc3d361145c32f620ecd605e6061a8bbc4cf0efce"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
