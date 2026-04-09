# typed: strict
# frozen_string_literal: true

# Homebrew formula for git-worktreeinclude.
class GitWorktreeinclude < Formula
  desc "Safely apply ignored files listed in .worktreeinclude between Git worktrees"
  homepage "https://github.com/satococoa/git-worktreeinclude"
  url "https://github.com/satococoa/git-worktreeinclude/archive/refs/tags/v0.5.1.tar.gz"
  version "0.5.1"
  sha256 "93192a3a7bc04fd8b9c13e661f24fb93b8ee56fc2c27d67033f20eafdb4468b7"
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
