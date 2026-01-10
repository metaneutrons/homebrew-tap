class Bups < Formula
  desc "USB print server for label printers"
  homepage "https://github.com/metaneutrons/bups"
  version "0.1.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.0/bups-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "be0d0812595b3c1be565b4838fbbf94ec9e3724852d67ac8d75361f845b1d32b"
    else
      url "https://github.com/metaneutrons/bups/releases/download/v0.1.0/bups-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "4e49de532a8f84cf68bc5a0d83f045ef9f3b5d4881755bebcd3278bab967ecdf"
    end
  end

  def install
    bin.install "bups"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bups --version")
  end
end
