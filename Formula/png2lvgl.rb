class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.2.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.3/png2lvgl-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "27078624e419eaa22fc52821f8df1991ac15c72aa3e2dce15af8ece6fffb2494"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.3/png2lvgl-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "20e8214cca414de068d74b34836fd4f3ca3f3c64a57a789ce1ae1fb23c0466d1"
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
