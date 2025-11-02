class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.2.3"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.3/png2lvgl-0.2.3-x86_64-apple-darwin.tar.gz"
      sha256 "0742ac4281eccd5fc5fcae398e40165ecad3dae37833695bd8b5b5ad8b6869ee"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.3/png2lvgl-0.2.3-aarch64-apple-darwin.tar.gz"
      sha256 "ba6350dfdb64e390a88d25d761616a984bd19c3dfaedb49e51444da5ab8b0938"
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
