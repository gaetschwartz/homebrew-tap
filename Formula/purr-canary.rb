class PurrCanary < Formula
  desc "Transcribe audio files and URLs on this computer"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.356"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.356/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "410dd9565f3ec424daf5d9ee03a50b07a134bfcaba753e54e603f6f93d96e186"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.356/purr-cli-linux-x64-all.tar.gz"
    sha256 "f9a62490778b39cc7774a74c318c77b1ac9a0f65cfdd9dde439760cd8172502d"
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
