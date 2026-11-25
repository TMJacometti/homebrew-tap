# Gerado por scripts/render-homebrew-formula.py a partir de
# scripts/homebrew/tmjlite.rb.in (repo TMJPlatform) — não edite no tap.
class Tmjlite < Formula
  desc "Embedded SQL database with git-style branches of data (CLI)"
  homepage "https://tmjlite.com.br"
  version "0.6.2"
  # Binário proprietário da TMJ Sistemas (uso e redistribuição sem modificação).
  license :cannot_represent

  on_macos do
    url "https://github.com/TMJacometti/tmjlite/releases/download/v0.6.2/tmjlite-cli-macos-arm64-0.6.2.tar.gz"
    sha256 "1c1e52eafa29ff1d87f9436cbbadcc3cdcc954cf9ae4ff3ad4a1166ebe024a50"

    depends_on arch: :arm64
  end

  on_linux do
    url "https://github.com/TMJacometti/tmjlite/releases/download/v0.6.2/tmjlite-cli-linux-x64-0.6.2.tar.gz"
    sha256 "72299f649829ee4c4363d62e18dce85c60ed57dd4ce0779c0a77afaebf440e92"

    depends_on arch: :x86_64
  end

  def install
    # O .tar.gz tem uma pasta só (tmjlite-cli-<plataforma>/); o Homebrew já
    # entra nela. Binário pré-compilado: no macOS, assinado com Developer ID
    # e notarizado.
    bin.install "tmjlite"
    doc.install "QUICKSTART.txt" if File.exist?("QUICKSTART.txt")
  end

  test do
    assert_match "tmjlite #{version}", shell_output("#{bin}/tmjlite --version")
  end
end
