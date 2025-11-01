class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.2.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.3/png2lvgl-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "41786f9bd1a7ba285b24e685be99fd1f7893dbcc3b97444c365e4183dff5b8a9"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.3/png2lvgl-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "45819fdfa752153123a61f7fcf715ce05b3f9443199798bf4822ac6d81168c65"
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
