class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.3.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.1/png2lvgl-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "3fe695d99d913aba26bc4fae22e580b4848a604e7112cafa18f2cefb309f5557"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.1/png2lvgl-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "0f0f279e9ad1d87e86a7c245f3dcca1ebe82086f422ed1d8caf2b43552ec5e95"
    end
  end

  def install
    bin.install "png2lvgl"
    man1.install "share/man/man1/png2lvgl.1"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/png2lvgl --version")
  end
end
