class PurrCanary < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.338"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.338/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "f98ff107db56a5669d98e65d46e36ecf60fc07946b1b156085e17c3f3b5538b8"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.338/purr-cli-linux-x64-all.tar.gz"
    sha256 "bad3f736964751e7577dd48c9ca56f3a717d3d6b899c918965fe4bf7c3fd8a93"
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
