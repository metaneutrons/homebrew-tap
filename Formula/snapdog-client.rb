class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.15.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.15.0/snapdog-v0.15.0-x86_64-apple-darwin.tar.gz"
      sha256 "9c2aa5e32ebf8b31af6b4e6e2ccb6194e15229709743bb24a5c09c136a16e799"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.15.0/snapdog-v0.15.0-aarch64-apple-darwin.tar.gz"
      sha256 "3c1d1717b67d7c15ccf17f7aa77fa08a4718669410ecd8df06a06914dfbf5edd"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
