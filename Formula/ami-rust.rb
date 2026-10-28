class AmiRust < Formula
  desc "Rust cross-development toolchain for x86-64 AROS"
  homepage "https://github.com/metaneutrons/ami-rust"
  url "https://github.com/metaneutrons/ami-rust/releases/download/v0.3.0/ami-rust-0.3.0-macos-aarch64.tar.xz"
  version "0.3.0"
  sha256 "6d276bbd4ce0010112d102dfc67e49bbea0d27d61851f6b9e0e69c59d64b7281"
  license :cannot_represent

  depends_on arch: :arm64
  depends_on :macos

  preserve_rpath

  def install
    libexec.install "libexec/ami-rust"
    ln_s version.to_s, libexec/"ami-rust/current"
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
