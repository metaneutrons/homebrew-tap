class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.3.4"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.4/png2lvgl-0.3.4-x86_64-apple-darwin.tar.gz"
      sha256 "649eaa856a1f125d6adc27fea3441f7700a6660e31b1aba451be4925616e517e"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.4/png2lvgl-0.3.4-aarch64-apple-darwin.tar.gz"
      sha256 "bd24ff57a4d73b351f8945fa243c3c314a08d7eb50276ee1edc07365b0735aa9"
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
