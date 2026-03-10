class Authbear < Formula
  desc "CLI auth broker with keychain-backed credentials"
  homepage "https://github.com/bhagyas/authbear"
  url "https://github.com/bhagyas/authbear/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "5ee906898046f820613fb1bff7cdd30aee93ca2aa40ac1df0cc18258ae57eeea"
  license "NOASSERTION"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/authbear"
  end

  test do
    output = shell_output("#{bin}/authbear --help")
    assert_match "authbear", output
  end
end
