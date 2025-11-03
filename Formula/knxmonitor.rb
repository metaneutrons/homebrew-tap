class Knxmonitor < Formula
  desc "KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "0.10.14"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.14/KnxMonitor-0.10.14-osx-x64.tar.gz"
      sha256 "867c6994052467f8ca9148003115b287750b186e9c36a43690ee96dd4185b865"
    else
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v0.10.14/KnxMonitor-0.10.14-osx-arm64.tar.gz"
      sha256 "f8f253d945a050c86b063df49579e2e5a259c27f8ea8ed8d872d6d90d7a1bc9d"
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
