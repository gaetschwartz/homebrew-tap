class PurrCanary < Formula
  desc "Transcribe audio files and URLs on this computer"
  homepage "https://github.com/gaetschwartz/purr"
  version "0.1.0-canary.357"
  license "MIT"

  on_macos do
    depends_on arch: :arm64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.357/purr-cli-macos-arm64-metal.tar.gz"
    sha256 "cae131de3d73c776a5a6ae3f965bf8ce51444ac5f6cf305c6d1143d4abbf98cc"
  end

  on_linux do
    depends_on arch: :x86_64

    url "https://github.com/gaetschwartz/purr/releases/download/canary-0.1.0-canary.357/purr-cli-linux-x64-all.tar.gz"
    sha256 "d6f271d55eeba28788fb50e50f50b8e2b2f4d1e9e58aa658779b828bb2e38160"
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
