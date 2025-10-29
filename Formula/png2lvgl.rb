class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.2.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.0/png2lvgl-0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "731875150789d17397a7b21c3a21b9c5a36646b39efebb5efd0172c498a3dc91"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.0/png2lvgl-0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "c75efed9cb2921cc63de6054951ee0e6bfbfb6668601f5e14e17ec5d93759368"
    end
  end

  def install
    bin.install "png2lvgl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/png2lvgl --version")
  end
end
