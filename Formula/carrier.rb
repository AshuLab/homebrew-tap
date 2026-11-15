class Carrier < Formula
  desc "Autonomous epic orchestrator: ships and reviews Solve epics with AI agents"
  homepage "https://github.com/AshuLab/carrier"
  url "https://registry.npmjs.org/@ashulab/carrier/-/carrier-0.6.0.tgz"
  sha256 "d7dd7b5b9b09dd5ef2c11615e54f8587cfa71f9faf6feee281a2a5d742f15f11"
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
