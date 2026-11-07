class RustgridAgent < Formula
  desc "Run Codex against RustGrid tickets and publish GitHub pull requests"
  homepage "https://github.com/RustGrid/rustgrid-agent"
  url "https://github.com/RustGrid/rustgrid-agent/releases/download/v1.7.0/rustgrid-agent-1.7.0.crate"
  sha256 "7395fa269d08d0ee1b47070784aa03a1fe8d275f6e7a4477992445fae242b961"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  def caveats
    <<~EOS
      To trace your Claude Code sessions onto RustGrid tickets, run:
        rustgrid-agent trace install
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rustgrid-agent --version")
  end
end
