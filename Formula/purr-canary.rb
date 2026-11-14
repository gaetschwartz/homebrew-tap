class PurrCanary < Formula
  desc "Transcribe audio files and URLs on this computer"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.354"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.354/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "84e339cba03f5bfb4c75634ea11aa3e9f3e55a937ace28d3245ccc23980e49e6"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.354/purr-cli-linux-x64-all.tar.gz"
    sha256 "a458307f243bdd62c357079abf0bdf87557e20d1779a6e2d2c923a4a68f75747"
  end

  livecheck do
    skip "Rolling canary, republished by CI on every build"
  end

  conflicts_with "purr", because: "both install a `purr` binary"

  def install
    if OS.linux?
      libexec.install Dir["*"]
      bin.install_symlink libexec/"purr"
    else
      bin.install "purr"
    end
  end

  test do
    system bin/"purr", "--version"
  end
end
