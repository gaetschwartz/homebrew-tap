class PurrCanary < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.348"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.348/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "d47e6aba7dd6e4593492c16d66fd18c1c85fb9d43914f5db0b6cd08f627b8f24"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.348/purr-cli-linux-x64-all.tar.gz"
    sha256 "044f2986ae6fd9c6c07f93b7d0046b78a09bd81c8185bb09e7e0b49667598374"
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
