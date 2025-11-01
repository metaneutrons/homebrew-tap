class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.2.2"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.2/png2lvgl-0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "a93e3bb6b0881ef944e03ba876860193dd289252f0bde937badcfb9bc41e47a5"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.2/png2lvgl-0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "eadeecb3ac2156d541ede8616f4d6ae93f40263dc4f01acc84799210f949792c"
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
