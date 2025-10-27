class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.1.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.1.0/png2lvgl-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "d7d2a862e370b1e690281b6224ec797838d956c8d6139f301028603fd44c02cd"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.1.0/png2lvgl-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "a2debd72a2563c4bd04fc0977a8ecfcb68c6a8d49bb3bca47bda9597d399b972"
    end
  end

  def install
    bin.install "png2lvgl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/png2lvgl --version")
  end
end
