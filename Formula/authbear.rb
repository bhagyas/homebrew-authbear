class Authbear < Formula
  desc "CLI auth broker with keychain-backed credentials"
  homepage "https://github.com/bhagyas/authbear"
  url "https://github.com/bhagyas/authbear/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "bc5420be2a34387d61e10897aef2ed376895471604bb029931b055fd6fb98c74"
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
