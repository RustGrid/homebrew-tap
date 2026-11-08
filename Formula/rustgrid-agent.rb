class RustgridAgent < Formula
  desc "Run Codex against RustGrid tickets and publish GitHub pull requests"
  homepage "https://github.com/RustGrid/rustgrid-agent"
  url "https://github.com/RustGrid/rustgrid-agent/releases/download/v1.8.1/rustgrid-agent-1.8.1.crate"
  sha256 "769725c9f6bb6597448e4e2e1b1960920a726c951e9a52058f9faea407ed67d9"
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
