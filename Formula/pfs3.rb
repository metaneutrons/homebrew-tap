class Pfs3 < Formula
  desc "PFS3 (Amiga Professional File System III) tools"
  homepage "https://github.com/metaneutrons/pfs3"
  version "0.1.0"
  license "LGPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.0/pfs3-0.1.0-x86_64-apple-darwin.tar.gz"
      sha256 "fbea88d3ce506ced1e6ef04b4b526d545ad1154a80e69a8b26a0d7dff26548e0"
    else
      url "https://github.com/metaneutrons/pfs3/releases/download/v0.1.0/pfs3-0.1.0-aarch64-apple-darwin.tar.gz"
      sha256 "d4083960ea1908e6723c55cc275271bcf04bd9e48b06853447655a35d5b0fc70"
    end
  end

  def install
    bin.install "pfs3"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/pfs3 --version")
  end
end
