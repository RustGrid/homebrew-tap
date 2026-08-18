class RustgridAgent < Formula
  desc "Run Codex against RustGrid tickets and publish GitHub pull requests"
  homepage "https://github.com/RustGrid/rustgrid-agent"
  url "https://github.com/RustGrid/rustgrid-agent/releases/download/v1.4.55/rustgrid-agent-1.4.55.crate"
  sha256 "4924b5a1831a024ed1f86aea10b144f7cd5607dbb11a1172c6bbc2015736f45a"
  license "MIT"

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rustgrid-agent --version")
  end
end
