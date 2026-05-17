class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.9.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.9.3/snapdog-v0.9.3-x86_64-apple-darwin.tar.gz"
      sha256 "e8fba3907fbacc473a7105226553fc784e03ba85a09b828b14a2b09fd83c4f98"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.9.3/snapdog-v0.9.3-aarch64-apple-darwin.tar.gz"
      sha256 "cdc2f228b157acc5724c42050b91f3262466cf4a9d5073e2e219d97500a31c8f"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
