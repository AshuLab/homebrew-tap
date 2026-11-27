cask "carrier" do
  version "0.21.0"

  on_arm do
    sha256 "752b9181db837370dfa9c6f7704a359c72d72ba4e2792517edfb3267bcb17f63"
    url "https://github.com/AshuLab/carrier/releases/download/v#{version}/Carrier-#{version}.zip"
  end
  on_intel do
    sha256 "9a96b64afd82fbc28d1109adc599f66fc492749e3c287c51a9229b5b8a99d1bc"
    url "https://github.com/AshuLab/carrier/releases/download/v#{version}/Carrier-#{version}-intel.zip"
  end

  name "Carrier"
  desc "Mac app for Carrier, the autonomous epic orchestrator"
  homepage "https://github.com/AshuLab/carrier"

  auto_updates true
  depends_on formula: "carrier"
  depends_on macos: :tahoe

  app "Carrier.app"

  # The app is signed ad hoc, not notarized (ADR 0017), and Homebrew quarantines what it downloads, so
  # Gatekeeper would stop it. Homebrew's own repository would not accept this step; this tap does.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Carrier.app"]
  end

  zap trash: [
    "~/Library/Caches/dev.ashulab.carrier",
    "~/Library/Preferences/dev.ashulab.carrier.plist",
  ]
end
