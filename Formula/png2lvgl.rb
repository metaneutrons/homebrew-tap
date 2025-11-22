class Png2lvgl < Formula
  desc "Convert PNG images to LVGL C arrays"
  homepage "https://github.com/metaneutrons/png2lvgl"
  version "0.3.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.0/png2lvgl-0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "1e57f92e5624c20813475cbc23d63aa6cbfbf32a38669d42b5d6e04605fb3090"
    else
      url "https://github.com/metaneutrons/png2lvgl/releases/download/v0.3.0/png2lvgl-0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "cb29932de97d0fefa47d5f963a44e9ebe80a1f3daa033ec7782fce33a9446aaa"
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
