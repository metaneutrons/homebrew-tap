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
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.5/aros-tools-v0.6.5-aarch64-apple-darwin.tar.gz"
      sha256 "1ebca6d94f2ab8bcf1b138c3a62febfcaea19c5023297230b87f9bbc57c7edf3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.5/aros-tools-v0.6.5-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "49ea67b6c6cf3516270d56625a6023ed1a4addd896d6a57f6eefe5918c1a8ba7"
    else
      url "https://github.com/metaneutrons/aros-tools/releases/download/v0.6.5/aros-tools-v0.6.5-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c8ea4ec4afdbf98997423884e981988411eeb6eea733e45191f1fda5e87bbc21"
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
