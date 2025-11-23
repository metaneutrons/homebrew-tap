class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.3.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.1/png2lvgl-0.3.1-x86_64-apple-darwin.tar.gz"
      sha256 "7ce47437f1b89768483531dc74a684d751741f73b194c8e780b31303a8cbfe26"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.1/png2lvgl-0.3.1-aarch64-apple-darwin.tar.gz"
      sha256 "621895662858de15c5153ecf92032996dbe9b93bdbb140c60afe7029fba59d41"
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
