#!/usr/bin/env bash
# ============================================================
# VanPlanner 3D — Déploiement automatique Cloudflare Pages
# ============================================================
# Usage : ./deploy.sh
# Prérequis : Node.js 18+ installé
# ============================================================

set -e

PROJECT_NAME="vanplanner-3d"

echo "🚐 VanPlanner 3D — Déploiement Cloudflare Pages"
echo "================================================"

# 1. Vérifier Node.js
if ! command -v node &> /dev/null; then
  echo "❌ Node.js n'est pas installé. Télécharge-le sur https://nodejs.org"
  exit 1
fi

# 2. Installer les dépendances si nécessaire
if [ ! -d "node_modules" ]; then
  echo "📦 Installation des dépendances (npm install)..."
  npm install
fi

# 3. Build de production
echo "🔨 Build de production (npm run build)..."
npm run build

# 4. Déployer via wrangler (installation auto si absent)
echo "☁️  Déploiement sur Cloudflare Pages..."
echo ""
echo "⚠️  Au premier lancement, une fenêtre navigateur va s'ouvrir"
echo "    pour t'authentifier sur ton compte Cloudflare."
echo "    Autorise l'accès et reviens dans le terminal."
echo ""

npx --yes wrangler@latest pages deploy dist --project-name="$PROJECT_NAME" --commit-dirty=true

echo ""
echo "✅ Déploiement terminé !"
echo "🌐 Ton app est en ligne sur : https://${PROJECT_NAME}.pages.dev"
echo ""
echo "💡 Pour installer la PWA :"
echo "   Ouvre l'URL ci-dessus dans Chrome/Edge → clique sur l'icône ⊕ dans la barre d'adresse"
