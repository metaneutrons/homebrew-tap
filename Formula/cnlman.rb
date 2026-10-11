class Cnlman < Formula
  desc "Click'n'Load receiver and decrypter with pyLoad hand-off"
  homepage "https://github.com/metaneutrons/cnlman"
  license "GPL-3.0-or-later"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/cnlman/releases/download/v0.2.0/cnlman-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "3a7ca29111c694c7f33ce5103424442c3c45ebb4b9d95bdf2e9efdc4e57f16ea"
    else
      url "https://github.com/metaneutrons/cnlman/releases/download/v0.2.0/cnlman-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "2a3c6b4b9021b9ee0bae3f69d24529e5ba292a08714325538a26f854d36cf49d"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/cnlman/releases/download/v0.2.0/cnlman-v0.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "be19e62e6129df6e1465f71cba13e8495267274296f672418a5024eb13029c6a"
    else
      url "https://github.com/metaneutrons/cnlman/releases/download/v0.2.0/cnlman-v0.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "25173dfb3370b9233490083a6709df8a434ef064d9ef4332654b775f8e805703"
    end
  end

  def install
    bin.install "cnlman"
  end

  test do
    # The binary reports the release core; a prerelease tag carries a suffix.
    assert_equal "cnlman #{version.major_minor_patch}", shell_output("#{bin}/cnlman --version").strip

    jk = "0123456789abcdef".unpack1("H*")
    crypted = "RnATJ+qxAkpHoFYfjZKfGIoMKq9yo6hLgc5BX1Qe/6qUNj/2AN1z0oQMNXP9K7qwLHW2sRDDJb8R3VaX/+cC8Q=="
    links = shell_output("#{bin}/cnlman decrypt --jk #{jk} --crypted #{crypted} --format links")
    assert_equal "https://example.org/smoke\nhttps://example.org/test\n", links
  end
end
