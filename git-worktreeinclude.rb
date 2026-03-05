# typed: strict
# frozen_string_literal: true

# Homebrew formula for git-worktreeinclude.
class GitWorktreeinclude < Formula
  desc "Safely apply ignored files listed in .worktreeinclude between Git worktrees"
  homepage "https://github.com/satococoa/git-worktreeinclude"
  url "https://github.com/satococoa/git-worktreeinclude/archive/refs/tags/v0.3.0.tar.gz"
  version "0.3.0"
  sha256 "3ed57806081d476382eae2a53f540665bbb5de956db02b0779f45c6d839547dd"
  license "MIT"

  depends_on "go" => :build
  depends_on "git"

  def install
    system "go", "build", *std_go_args(output: bin/"git-worktreeinclude"), "./cmd/git-worktreeinclude"
    generate_completions_from_executable(bin/"git-worktreeinclude", "completion", shells: [:bash, :zsh, :fish])
  end

  test do
    output = shell_output("#{bin}/git-worktreeinclude --help")
    assert_match "git-worktreeinclude", output

    completions = {}
    %w[bash zsh fish].each do |shell|
      completions[shell] = shell_output("#{bin}/git-worktreeinclude completion #{shell}")
      refute_empty completions[shell].strip
    end

    assert_match "#compdef git-worktreeinclude", completions["zsh"]
  end
end
