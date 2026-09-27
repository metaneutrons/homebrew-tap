class ArosTools < Formula
  desc "Reproducible host-side build and development tools for AROS"
  homepage "https://github.com/metaneutrons/aros-tools"
  license "GPL-3.0-or-later"

  depends_on "cmake"
  depends_on "curl"
  depends_on "git"
  depends_on "ninja"
  depends_on "python@3.14"

  on_macos do
    on_arm do
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.13/aros-tools-v0.3.13-aarch64-apple-darwin.tar.gz"
      sha256 "fbb0fd8c6a71db76e1253e73201ad0c06774449758bda47083c5a28ba97ff2bb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.13/aros-tools-v0.3.13-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8725d3edcd578b069a510784701e916050f5275fab74987b60822ee786809ecb"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.3.13/aros-tools-v0.3.13-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1b8ca19436b467d15c9ba4a9595262d748e8739e93f5f1e403ed3471a620c437"
    end
  end

  def install
    bin.install Dir["bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/aros --version")
    system "#{bin}/aros-collect", "--help"
  end
end
