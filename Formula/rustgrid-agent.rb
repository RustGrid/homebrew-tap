class RustgridAgent < Formula
  desc "Run Codex against RustGrid tickets and publish GitHub pull requests"
  homepage "https://github.com/RustGrid/rustgrid-agent"
  url "https://github.com/RustGrid/rustgrid-agent/releases/download/v1.4.22/rustgrid-agent-1.4.22.crate"
  sha256 "3334487938e2a43660f763c1b6de4d4a7128e003828ab7b1db794cab7aa4c080"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rustgrid-agent --version")
  end
end
