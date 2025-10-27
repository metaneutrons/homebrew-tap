class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.1.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.1.1/png2lvgl-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "b3ac5db80746c969e847355dbb9b3642bae4adb84b98c9c0e4529aac0d80f874"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.1.1/png2lvgl-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "4494273873512f0a173d2099b93e5587ffcba87d31af4c6b4fdb85151529ee27"
    end
  end

  def install
    bin.install "png2lvgl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/png2lvgl --version")
  end
end
