class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.11.4"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.11.4/snapdog-v0.11.4-x86_64-apple-darwin.tar.gz"
      sha256 "7d1aae1f03ff234ce397f714f20ab76d40ec5087c9ed746bed8c827b6a9b1396"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.11.4/snapdog-v0.11.4-aarch64-apple-darwin.tar.gz"
      sha256 "c2cd7bdfe083d38bfb129f4cd4dd6ce8f50cc7e368cb232131b5f01411f548fb"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
