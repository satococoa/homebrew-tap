# typed: strict
# frozen_string_literal: true

# Homebrew formula for git-worktreeinclude.
class GitWorktreeinclude < Formula
  desc "Safely apply ignored files listed in .worktreeinclude between Git worktrees"
  homepage "https://github.com/satococoa/git-worktreeinclude"
  url "https://github.com/satococoa/git-worktreeinclude/archive/refs/tags/v0.2.0.tar.gz"
  version "0.2.0"
  sha256 "1ba88d962dbc14a50aa2ec93b834462060a1371f68d11b99adda35e6237acdcf"
  license "MIT"

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", *std_go_args(output: bin/"git-worktreeinclude"), "./cmd/git-worktreeinclude"
  end

  test do
    output = shell_output("#{bin}/git-worktreeinclude --help", 2)
    assert_match "Usage: git-worktreeinclude", output
  end
end
