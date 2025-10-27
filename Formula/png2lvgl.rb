class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.1.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.1.0/png2lvgl-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "59cdd37783da0739a9e4095c5e1efe3e2ac50d45843f95cbc1e53646ff3bb2d2"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.1.0/png2lvgl-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "3bc6e39f365b77d8b06ae32b8f0103f90fc510c609ee3ed30cb61c831c68a754"
    end
  end

  def install
    bin.install "png2lvgl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/png2lvgl --version")
  end
end
