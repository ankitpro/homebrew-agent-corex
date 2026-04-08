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
  version "2.9.0"
  license "MIT"

  on_macos do
    # arm64 binary; runs on Intel Macs via Rosetta 2
    url "https://github.com/ankitpro/agent-corex/releases/download/v#{version}/agent-corex-macos-arm64"
    sha256 "22282a77fe3b8320daf14026b427d2740d1d8a73977f93664d4b7ed9b8bf0fa6"
  end

  on_linux do
    url "https://github.com/ankitpro/agent-corex/releases/download/v#{version}/agent-corex-linux-x86_64"
    sha256 "0546108c9844514b122cd140f0086c74ceadfc55f5e46c52ecdce147cc70c415"
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
