class Wtcp < Formula
  desc "Copy files/dirs from the main git worktree into the current worktree"
  homepage "https://github.com/satococoa/wtcp"
  url "https://github.com/satococoa/wtcp/archive/refs/tags/v0.1.1.tar.gz"
  version "0.1.1"
  sha256 "65fd88833d5812da7c1117fe50e11c7333980125086079a38d91c8484c623004"
  license "MIT"

  depends_on "rsync"

  def install
    bin.install "bin/wtcp"
  end

  test do
    assert_match "wtcp:", shell_output("#{bin}/wtcp --help")
  end
end
