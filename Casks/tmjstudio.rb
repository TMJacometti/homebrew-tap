# Gerado por scripts/render-homebrew-cask.py a partir de
# scripts/homebrew/tmjstudio.rb.in (repo TMJPlatform) — não edite no tap.
cask "tmjstudio" do
  arch arm: "arm64", intel: "x64"

  version "0.6.3"
  sha256 arm:   "48f662fd1529469faa8e4c3c897940b4411a8e72f67b771c58dae150db22e7fd",
         intel: "a972c2a720248a6bc9dc4afaf9f91cddc194eb6038d86e664fa00ac1c8d9d5f9"

  url "https://github.com/TMJacometti/tmjlite/releases/download/studio-v#{version}/TMJStudio_#{version}_macos-#{arch}.dmg"
  name "TMJStudio"
  desc "Native IDE for the TMJLite embedded database"
  homepage "https://tmjlite.com.br"

  depends_on macos: ">= :big_sur"

  # Assinado com Developer ID e notarizado: abre sem aviso do Gatekeeper.
  app "TMJStudio.app"

  uninstall quit: "com.tmjsistemas.tmjstudio"
end
