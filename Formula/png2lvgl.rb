class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.3.5"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.5/png2lvgl-0.3.5-x86_64-apple-darwin.tar.gz"
      sha256 "39ec1861e8ac019ca25caf82cec6701a44432dd5297d54058d2a90e521e6704d"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.5/png2lvgl-0.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "0f058e84918ab1500fa42bee661a1f2ad1b7c1ded34a95a5c78259ad67f53e3e"
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
