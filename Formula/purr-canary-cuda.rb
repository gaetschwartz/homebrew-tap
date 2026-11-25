class PurrCanaryCuda < Formula
  desc "Transcribe audio files and URLs on this computer (with CUDA)"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.366"
  license "MIT"

  depends_on :linux
  depends_on arch: :x86_64

  url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.366/purr-cli-linux-x64-all.tar.gz"
  sha256 "3f383915f897ba594eaadc0d6c8436e758f648e06f27fa076dda42a2fe536ed1"

  livecheck do
    skip "Rolling canary, republished by CI on every build"
  end

  conflicts_with "purr-canary", because: "both install a `purr` binary"
  conflicts_with "purr", because: "both install a `purr` binary"
  conflicts_with "purr-cuda", because: "both install a `purr` binary"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"purr"
  end

  def caveats
    <<~EOS
      This build adds the CUDA libraries, so the download is large, and it needs an NVIDIA driver to use them.
    EOS
  end

  test do
    system bin/"purr", "--version"
  end
end
