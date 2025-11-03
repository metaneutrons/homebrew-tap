class Knxmonitor < Formula
  desc "KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "0.10.14"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.14/KnxMonitor-0.10.14-osx-x64.tar.gz"
      sha256 "f05712b51bcb9d4515fac3d8ebd778395f3693f1044e4eb7eaf089982d54f237"
    else
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.14/KnxMonitor-0.10.14-osx-arm64.tar.gz"
      sha256 "411756a3af0ed582c82c6f7a69284ef932ad9281dbf223d5c9c1b678bc1741ec"
    end
  end

  def install
    bin.install "KnxMonitor" => "knxmonitor"
    man1.install "docs/knxmonitor.1" if File.exist?("docs/knxmonitor.1")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/knxmonitor --version")
  end
end
