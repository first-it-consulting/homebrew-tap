class Hlw < Formula
  desc "Launch AI coding agents against configurable endpoints, picking the model at launch"
  homepage "https://github.com/first-it-consulting/hlw"
  url "https://github.com/first-it-consulting/hlw/archive/refs/tags/v0.1.1.tar.gz"
  version "0.1.1"
  sha256 "9d5c14f740a4a522c62d06b35a0a948f549c6d24e6c565d3a0ab20c7a1c248fd"
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
