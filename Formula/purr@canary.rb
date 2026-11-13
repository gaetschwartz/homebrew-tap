class PurrATCanary < Formula
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.336"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.336/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "093731715c0ccfe2f1dc98105497ed8c9871d5a17328cfd259d8f341879d46ff"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.336/purr-cli-linux-x64-all.tar.gz"
    sha256 "065e7f1d399173ba9d622850f43dc861f9118d53cc43649f0455f0a99cfb6be0"
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
