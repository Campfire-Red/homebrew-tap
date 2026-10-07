class CampfireServer < Formula
  desc "Connector for Campfire's end-to-end encrypted voice and text chat"
  homepage "https://campfire.red/"
  # A tag and its commit rather than the source tarball: the repository is
  # still private, and git is the one download Homebrew authenticates.
  url "https://github.com/Campfire-Red/Campfire.git",
      tag:      "v0.5.0",
      revision: "33fae857ec80fd6465434333bbf43ef85d9f918b"
  license "EUPL-1.2"
  head "https://github.com/Campfire-Red/Campfire.git", branch: "main"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/campfire-server")
  end

  service do
    run opt_bin/"campfire-server"
    keep_alive true
    log_path var/"log/campfire-server.log"
    error_log_path var/"log/campfire-server.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/campfire-server --version")

    port = free_port
    pid = spawn({ "PORT" => port.to_s }, bin/"campfire-server")
    begin
      sleep 3
      assert_match "\"name\"", shell_output("curl -s http://127.0.0.1:#{port}/health")
    ensure
      Process.kill "TERM", pid
      Process.wait pid
    end
  end
end
