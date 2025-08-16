class Knxmonitor < Formula
  desc "Professional KNX/EIB bus monitoring and debugging tool"
  homepage "https://github.com/metaneutrons/KnxMonitor"
  version "0.10.0"
  license "GPL-3.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v#{version}/KnxMonitor-#{version}-osx-x64.tar.gz"
      sha256 "8fc7f65b8c9c8e085b26f677ee1d191385bce9cff195ae3ac8d2cc33fb998704" # Will be updated when release is available
    end
    if Hardware::CPU.arm?
      url "https://github.com/metaneutrons/KnxMonitor/releases/download/v#{version}/KnxMonitor-#{version}-osx-arm64.tar.gz"
      sha256 "63074ad6c8ae0a5a630a892096effe864c322cf589dec7a30e23ac46f853188f" # Will be updated when release is available
    end
  end

  def install
    bin.install "KnxMonitor" => "knxmonitor"
    
    # Install man page if it exists in the archive
    if File.exist?("docs/knxmonitor.1")
      man1.install "docs/knxmonitor.1"
    end
    
    # Install documentation
    if File.exist?("README.md")
      (share/"knxmonitor").install "README.md"
    end
    
    # Install example CSV file if present
    if File.exist?("knx-addresses.csv")
      (share/"knxmonitor"/"examples").install "knx-addresses.csv"
    end
  end

  test do
    # Test that the binary exists and shows version
    assert_match version.to_s, shell_output("#{bin}/knxmonitor --version")
    
    # Test that help command works
    assert_match "KNX Monitor", shell_output("#{bin}/knxmonitor --help")
    
    # Test that it shows available connection types
    help_output = shell_output("#{bin}/knxmonitor --help")
    assert_match "connection-type", help_output
    assert_match "tunneling", help_output
    assert_match "routing", help_output
  end
end