class RustgridAgent < Formula
  desc "Run Codex against RustGrid tickets and publish GitHub pull requests"
  homepage "https://github.com/RustGrid/rustgrid-agent"
  url "https://github.com/RustGrid/rustgrid-agent/releases/download/v1.9.1/rustgrid-agent-1.9.1.crate"
  sha256 "078e653fcaa4ced6e3374b972a52a58751542a98411232542ea3203512a84b25"
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
