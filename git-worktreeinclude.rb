# typed: strict
# frozen_string_literal: true

# Homebrew formula for git-worktreeinclude.
class GitWorktreeinclude < Formula
  desc "Safely apply ignored files listed in .worktreeinclude between Git worktrees"
  homepage "https://github.com/satococoa/git-worktreeinclude"
  url "https://github.com/satococoa/git-worktreeinclude/archive/refs/tags/v0.1.0.tar.gz"
  version "0.1.0"
  sha256 "182f1f1ad3f337aac60e2029a21f38c7c6169ca4af7ae5c441489098e63d6e0d"
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
