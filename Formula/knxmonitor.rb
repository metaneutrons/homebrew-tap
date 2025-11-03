class Knxmonitor < Formula
  desc "KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "0.10.13"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.13/KnxMonitor-0.10.13-osx-x64.tar.gz"
      sha256 "5b2eb284c0f7517306d544fc74e2bdb6033893d5445e8a60931453183d421841"
    else
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.13/KnxMonitor-0.10.13-osx-arm64.tar.gz"
      sha256 "4e37db265a14a2780a1baecb7871df81c37bf7f05e9460c78191da634c6b939a"
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
