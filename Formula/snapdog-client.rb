class SnapdogClient < Formula
  desc "SnapDog multiroom audio client"
  homepage "https://github.com/metaneutrons/snapdog"
  version "0.12.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.0/snapdog-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "b5c01a4120d6d41cea40fb964d52a9010ab8dba78fd5199bb4fc038efb54d40d"
    else
      url "https://github.com/metaneutrons/snapdog/releases/download/v0.12.0/snapdog-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "c831a5bfe0dd59a3cfa2bb77d3de69189f8ef8037b333f9659ef4ecff3d59e41"
    end
  end

  def install
    bin.install "snapdog-client"
  end
end
