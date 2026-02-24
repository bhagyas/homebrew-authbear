class Authbear < Formula
  desc "CLI auth broker with keychain-backed credentials"
  homepage "https://github.com/bhagyas/authbear"
  url "https://github.com/bhagyas/authbear/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "caac6db0a42eb3c8bf43b2399c4d95f6c5e4ff039f5ac3b325700cc2f7a6956f"
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
