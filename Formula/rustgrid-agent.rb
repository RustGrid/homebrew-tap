class RustgridAgent < Formula
  desc "Run Codex against RustGrid tickets and publish GitHub pull requests"
  homepage "https://github.com/RustGrid/rustgrid-agent"
  url "https://github.com/RustGrid/rustgrid-agent/releases/download/v1.8.0/rustgrid-agent-1.8.0.crate"
  sha256 "0dccd76b6056bb5c03b61ae718eb7782c9d8c6d41cf2429df79953a8eb1b9ca1"
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
