# typed: strict
# frozen_string_literal: true

# Homebrew formula for git-worktreeinclude.
class GitWorktreeinclude < Formula
  desc "Safely apply ignored files listed in .worktreeinclude between Git worktrees"
  homepage "https://github.com/satococoa/git-worktreeinclude"
  url "https://github.com/satococoa/git-worktreeinclude/archive/refs/tags/v0.2.1.tar.gz"
  version "0.2.1"
  sha256 "b9c1d679083ff3f6917179938792d5ed359a2f24a05e7abf46748a246129b83a"
  license "MIT"

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", *std_go_args(output: bin/"git-worktreeinclude"), "./cmd/git-worktreeinclude"
    generate_completions_from_executable(bin/"git-worktreeinclude", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    output = shell_output("#{bin}/git-worktreeinclude --help", 2)
    assert_match "git-worktreeinclude", output

    completions = {}
    %w[bash zsh fish].each do |shell|
      completions[shell] = shell_output("#{bin}/git-worktreeinclude completion #{shell}")
      refute_empty completions[shell].strip
    end

    assert_match "#compdef git-worktreeinclude", completions["zsh"]
  end
end
