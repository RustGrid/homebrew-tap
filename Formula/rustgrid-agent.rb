class RustgridAgent < Formula
  desc "Run Codex against RustGrid tickets and publish GitHub pull requests"
  homepage "https://github.com/RustGrid/rustgrid-agent"
  url "https://github.com/RustGrid/rustgrid-agent/releases/download/v1.6.4/rustgrid-agent-1.6.4.crate"
  sha256 "cd42bd26c62d0b85b5a2efbf4ad452c672bdd01fa266c00a221b2ecdd5ae2fa8"
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
