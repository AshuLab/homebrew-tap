class Carrier < Formula
  desc "Autonomous epic orchestrator: ships and reviews Solve epics with AI agents"
  homepage "https://github.com/AshuLab/carrier"
  url "https://registry.npmjs.org/@ashulab/carrier/-/carrier-0.2.0.tgz"
  sha256 "4217d7c456c1f374ccf855867379a9a0749b91c968f061ee09ba67ba136e83a4"
  license "MIT"

  depends_on "gh"
  depends_on "git"
  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec.glob("bin/*")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/carrier --version")
  end
end
