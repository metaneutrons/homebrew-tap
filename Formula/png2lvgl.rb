class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.1.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.1.1/png2lvgl-0.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "1332e66fb12ef015e2f901dead92048096dba482c06cb192c1d9ffae1d87763a"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.1.1/png2lvgl-0.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "e021fa92e02679f1f4e5e383928d39c9bd512b6e34e653ec8b4b89b89219df45"
    end
  end

  def install
    bin.install "png2lvgl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/png2lvgl --version")
  end
end
