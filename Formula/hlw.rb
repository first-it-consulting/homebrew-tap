class Hlw < Formula
  desc "Launch AI coding agents against configurable endpoints, picking the model at launch"
  homepage "https://github.com/first-it-consulting/hlw"
  url "https://github.com/first-it-consulting/hlw/archive/refs/tags/v0.1.2.tar.gz"
  version "0.1.2"
  sha256 "ac336cd99998ad10f3f73cee5a369de13c00d57fd4508dd57cf33d82b339413d"
  license "MIT"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s -w
      -X github.com/first-it-consulting/hlw/cmd.Version=#{version}
      -X github.com/first-it-consulting/hlw/cmd.Commit=v#{version}
      -X github.com/first-it-consulting/hlw/cmd.Date=#{time.iso8601}
    ]
    system "go", "build", "-ldflags", ldflags.join(" "), "-o", bin/"hlw", "."
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/hlw --version")
  end
end
