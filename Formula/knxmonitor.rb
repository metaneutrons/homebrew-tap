class Knxmonitor < Formula
  desc "KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "0.10.9"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.9/KnxMonitor-0.10.9-osx-x64.tar.gz"
      sha256 "9c724cfb9035ce8088194eaf0a3f233eab4b8eb57ec52847061f704053d99faa"
    else
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.9/KnxMonitor-0.10.9-osx-arm64.tar.gz"
      sha256 "91bbefbf382fea9cd896e92e2da619380fdc4f0effc84977d4174cd2a34add53"
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
