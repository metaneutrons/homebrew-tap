class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.2.1"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.1/png2lvgl-0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "185d5448bf37186b257e652576450cefb37fa034ea22e95c9687592e0f9d4ad5"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.2.1/png2lvgl-0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "3d0956af84ac852c7df1b550d63932d9428ea0cb095373f9e5b63d5abb176378"
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
