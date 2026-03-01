# typed: strict
# frozen_string_literal: true

# Homebrew formula for git-worktreeinclude.
class GitWorktreeinclude < Formula
  desc "Safely apply ignored files listed in .worktreeinclude between Git worktrees"
  homepage "https://github.com/satococoa/git-worktreeinclude"
  url "https://github.com/satococoa/git-worktreeinclude/archive/db3d596367482bb19a2db469eb9913c7d2841a5d.tar.gz"
  version "0.0.0"
  sha256 "f89dc85277554a23fe6ae849c61a929205ffa9ad33ec4bde4cf8a8402289abd2"
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
