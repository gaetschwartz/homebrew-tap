class PurrCanary < Formula
  desc "Transcribe audio files and URLs on this computer"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.365"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.365/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "4ffc9b3b3f3775a4f1489bae990dcf4dcabc3ee8643df4dba2ad588c7edb72a0"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.365/purr-cli-linux-x64-all.tar.gz"
    sha256 "cb7933d4bd8c3deca5d2a26e88f68cb1ff51daccb666176d85a9b28a02c77790"
  end

  livecheck do
    skip "Rolling canary, republished by CI on every build"
  end

  conflicts_with "purr", because: "both install a `purr` binary"

  def install
    libexec.install Dir["*"]
    if OS.linux?
      bin.install_symlink libexec/"purr"
    else
      bin.write_exec_script libexec/"purr"
    end
  end

  test do
    system bin/"purr", "--version"
  end
end
