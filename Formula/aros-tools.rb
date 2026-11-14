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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.16/aros-tools-v0.6.16-aarch64-apple-darwin.tar.gz"
      sha256 "800f4d0605a847cc842c959af32af1d31197eed0dfb33f2d8d503e4846a2b83b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.16/aros-tools-v0.6.16-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9402ce24338d3f6026830fde70660b2be2f044a7b80b6de31f9ba5870503075f"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.16/aros-tools-v0.6.16-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a72f7040226f43defe3e36aabc5d8174f8579ef895ac59bf21f134f01d9abbdb"
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
