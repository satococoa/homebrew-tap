class Wtcp < Formula
  desc "Copy files/dirs from the main git worktree into the current worktree"
  homepage "https://github.com/satococoa/wtcp"
  url "https://github.com/satococoa/wtcp/archive/ea03b65de4bb61b85f8ec4c775ae69bcd99bc6af.tar.gz"
  version "0.1.0"
  sha256 "db14ac573318dcf8ced6fb3ea5ddd99cbd8d83e88ba38ef87a95b8824942474e"
  license "MIT"

  depends_on "rsync"

  def install
    bin.install "bin/wtcp"
  end

  test do
    assert_match "wtcp:", shell_output("#{bin}/wtcp --help")
  end
end
