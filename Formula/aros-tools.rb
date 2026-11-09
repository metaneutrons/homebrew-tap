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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.14/aros-tools-v0.6.14-aarch64-apple-darwin.tar.gz"
      sha256 "7c1727184b6ae0d2c1d89262b4b2aad8e2edef89a386901474520d6f2419528a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.14/aros-tools-v0.6.14-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "109b0e9367f79c7ea9f9b465fd1f22b520979b122ef9529c5f8b5feb8459dcf8"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.14/aros-tools-v0.6.14-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6e59302af34c97ea2aba84deef33c54cca49dbfe5e42fee4152cf6740eed22fc"
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
