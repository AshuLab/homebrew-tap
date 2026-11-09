cask "carrier" do
  version "0.1.2"
  sha256 "bfed3bcc497aa59fec1113c4f7fcc6516cb1b7a24643400469f070d50d84b769"

  url "https://github.com/AshuLab/carrier/releases/download/v#{version}/Carrier-#{version}.zip"
  name "Carrier"
  desc "Mac app for Carrier, the autonomous epic orchestrator"
  homepage "https://github.com/AshuLab/carrier"

  depends_on formula: "carrier"
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Carrier.app"

  # The app is signed ad hoc, not notarized (ADR 0017), and Homebrew quarantines what it downloads, so
  # Gatekeeper would stop it. Homebrew's own repository would not accept this step; this tap does.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Carrier.app"]
  end

  zap trash: "~/Library/Preferences/dev.ashulab.carrier.plist"
end
