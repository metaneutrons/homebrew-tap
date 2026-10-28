class AmiRust < Formula
  desc "Rust cross-development toolchain for x86-64 AROS"
  homepage "https://github.com/metaneutrons/ami-rust"
  url "https://github.com/metaneutrons/ami-rust/releases/download/v0.3.1/ami-rust-0.3.1-macos-aarch64.tar.xz"
  version "0.3.1"
  sha256 "d8f1acdeba9d0b09dc31ea2f7b61891280a8ed99d28fa7c8c281576c88727610"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  preserve_rpath

  def install
    # The Direct archive is the flat SDK tree; Homebrew owns its versioned root.
    sdk = libexec/"ami-rust"/version
    sdk.install Dir["*"]
    File.symlink version.to_s, libexec/"ami-rust"/"current"
  end

  def caveats
    <<~EOS
      To opt in to the tracking rustup alias, run:
        rustup toolchain link aros "#{opt_prefix}/libexec/ami-rust/current"

      To opt in to this version specifically, run:
        rustup toolchain link aros-#{version} "#{prefix}/libexec/ami-rust/#{version}"
    EOS
  end

  test do
    sdk = libexec/"ami-rust/#{version}"
    assert_predicate sdk/"bin/rustc", :executable?
    assert_predicate sdk/"bin/cargo", :executable?
  end
end
