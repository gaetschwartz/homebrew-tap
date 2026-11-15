cask "purr-app-canary" do
  version "0.1.0-canary.355"
  sha256 "1867890e141e5b362633959eda6dd9f81da4b5a39864e966310200c1048127f6"

  url "https://github.com/gaetschwartz/purr/releases/download/canary-#{version}/purr-desktop-macos-arm64-metal.dmg"
  name "Purr"
  desc "Transcribe audio files and URLs on this computer"
  homepage "https://github.com/gaetschwartz/purr"

  livecheck do
    skip "Rolling canary, republished by CI on every build"
  end

  conflicts_with cask: "purr-app"
  depends_on arch: :arm64
  depends_on formula: "gaetschwartz/tap/purr-canary"

  app "purr-app.app"

  # The app is not notarized, so Gatekeeper would refuse to open it.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/purr-app.app"]
  end
end
