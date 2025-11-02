class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.2.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.3/png2lvgl-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "561a359d8b3dc152bdc90b34a171a63344576cdd31c243185a4826cb54201d63"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.3/png2lvgl-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "be66ad1d7f5b3a11d3990c2b8764d5827bf6638e616a6fce43d68468f8bdff10"
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
