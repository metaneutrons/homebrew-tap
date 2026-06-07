class Ruscore < Formula
  desc "Scrape MuseScore sheet music and convert to high-quality vector PDF"
  homepage "https://github.com/metaneutrons/ruscore"
  version "1.5.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/ruscore/releases/download/ruscore-v1.5.0/ruscore-ruscore-v1.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "822708d181ae2084728751e59d8b384ca8e5a24588becc647ffd07314e06b420"
    else
      url "https://github.com/metaneutrons/ruscore/releases/download/ruscore-v1.5.0/ruscore-ruscore-v1.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "21141d977108bbb1b8e807d951a324c3b5b24087963254dc73f4fc88ffd077be"
    end
  end

  def install
    bin.install "ruscore"
    bin.install "ruscore-server"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ruscore --version")
  end
end
