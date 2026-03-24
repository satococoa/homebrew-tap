# typed: strict
# frozen_string_literal: true

# Homebrew formula for git-worktreeinclude.
class GitWorktreeinclude < Formula
  desc "Safely apply ignored files listed in .worktreeinclude between Git worktrees"
  homepage "https://github.com/satococoa/git-worktreeinclude"
  url "https://github.com/satococoa/git-worktreeinclude/archive/refs/tags/v0.4.2.tar.gz"
  version "0.4.2"
  sha256 "aefc4965f60fdd7f8be01b6fc4b5ba3ba2b7c3e8dde8e42cb4c167fb01564899"
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
