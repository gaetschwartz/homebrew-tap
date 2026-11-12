cask "purr-app@nightly" do
  version "2026.11.12"
  sha256 "368af0ad95056bb2c46956d0327a1d3108c257c58b4a07c11f7cec68c27410d7"

  url "https://github.com/gaetschwartz/purr/releases/download/nightly-#{version}/purr-desktop-macos-arm64-metal.dmg"
  name "Purr"
  desc "Transcribe audio files and URLs with Whisper"
  homepage "https://github.com/gaetschwartz/purr"

  livecheck do
    skip "Rolling nightly, republished by CI on every build"
  end

  conflicts_with cask: "purr-app"
  depends_on arch: :arm64
  depends_on formula: "gaetschwartz/tap/purr@nightly"

  app "purr-app.app"

  # The app is not notarized, so Gatekeeper would refuse to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/purr-app.app"]
  end
end
