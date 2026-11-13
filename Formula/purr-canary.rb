class PurrCanary < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.341"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.341/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "c1ec49592a07b1ed79897c3a696e9c43767001e35a9a6c8b96a2ccf5f86bda8b"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.341/purr-cli-linux-x64-all.tar.gz"
    sha256 "229f974c1fe7bfe3a30db95bfb5610a1b213c066d3ea0071d28977d3dcfba6b7"
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
