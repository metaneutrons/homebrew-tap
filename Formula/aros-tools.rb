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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.11/aros-tools-v0.6.11-aarch64-apple-darwin.tar.gz"
      sha256 "2ce6167f46214426ad224019a5bfcef32fa19f9ba29b2dfa278647579a2dbd18"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.11/aros-tools-v0.6.11-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "eb6e3c190a23bbf319951a7f2d41f49713aaa3890c70c31c80aba4c616229ffa"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.11/aros-tools-v0.6.11-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c22084c89a2df1abe15ffa524990c2a767e574b54b84688945bd3ade1c7534de"
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
