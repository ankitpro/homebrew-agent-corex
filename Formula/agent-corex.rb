# typed: false
# frozen_string_literal: true

# Homebrew formula for agent-corex.
#
# Tap:    brew tap ankitpro/agent-corex
# Install: brew install agent-corex
#
# This formula installs the pre-built binary released on GitHub.
# No Python or extra dependencies required.

class AgentCorex < Formula
  desc "Fast, accurate MCP tool router — detect, inject, and manage MCP servers for AI agents"
  homepage "https://github.com/ankitpro/agent-corex"
  version "3.0.3"
  license "MIT"

  on_macos do
    # arm64 binary; runs on Intel Macs via Rosetta 2
    url "https://github.com/ankitpro/agent-corex/releases/download/v#{version}/agent-corex-macos-arm64"
    sha256 "fbed3ff0ec82160eefaf17533de8e38da1cc690721947f9d25dcb79c3575b868"
  end

  on_linux do
    url "https://github.com/ankitpro/agent-corex/releases/download/v#{version}/agent-corex-linux-x86_64"
    sha256 "6d9f97a62b594550a927e4fd22f92190225c1af320d6fa664e2fdc8535a08727"
  end

  def install
    if OS.mac?
      bin.install "agent-corex-macos-arm64" => "agent-corex"
    else
      bin.install "agent-corex-linux-x86_64" => "agent-corex"
    end
  end

  def caveats
    <<~EOS
      Get started:
        agent-corex login --key <your-api-key>
        agent-corex detect
        agent-corex init

      Docs: https://github.com/ankitpro/agent-corex
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-corex version")
  end
end
