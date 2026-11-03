# typed: strict
# frozen_string_literal: true

# Homebrew formula for git-worktreeinclude.
class GitWorktreeinclude < Formula
  desc "Safely apply ignored files listed in .worktreeinclude between Git worktrees"
  homepage "https://github.com/satococoa/git-worktreeinclude"
  url "https://github.com/satococoa/git-worktreeinclude/archive/refs/tags/v0.5.3.tar.gz"
  version "0.5.3"
  sha256 "c2c957ed450aaa295af350ad4f9139e9ea0f1f97661fde8e89af82e91052ec4b"
  license "MIT"

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", *std_go_args(output: bin/"git-worktreeinclude"), "./cmd/git-worktreeinclude"
  end

  test do
    output = shell_output("#{bin}/git-worktreeinclude --help")
    assert_match "git-worktreeinclude", output
  end
end
