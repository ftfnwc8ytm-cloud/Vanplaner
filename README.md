# 🚐 VanPlanner 3D

**Configurateur 3D d'aménagement de vans — PWA online + offline**

Application web pour concevoir l'aménagement de son van (fourgon aménagé, van-life) en 3D, avec catalogue produits intégré (IKEA, Décathlon, équipements van spécialisés, matériel électrique), presets prêts à l'emploi, calculs de charge utile et pré-vérification VASP française.

## ✨ Fonctionnalités

- 🚐 **~25 modèles de vans** paramétriques (VW Transporter T1→T6, Ducato, Sprinter, Trafic, Master, Boxer, Crafter, Transit, Iveco Daily, RAM ProMaster…)
- 🏕 **Toit relevable** (pop-top) pour T3 Westfalia, T5/T6 California
- 📦 **Catalogue produits** intégré (IKEA + Décathlon + Van Specialist + Électrique)
- 🎨 **Éditeur 3D** avec Three.js + React Three Fiber
- 🏗 **6 presets d'aménagement** : Couple Weekend, Nomade Full-Time, Famille 4p, Surf-Trip, Digital Nomad, Bivouac Minimaliste
- 📊 **Bilan temps réel** : prix, poids, répartition catégorie, alerte charge utile
- ⚖️ **Pré-checklist VASP** (arrêté du 5 novembre 1984)
- 🗂 **Système de calques** (visibilité, verrou)
- 💾 **Import/Export JSON** `.vanplan.json`
- 📱 **PWA installable** (icône bureau, plein écran, offline)
- 🔌 **Mode offline complet** grâce au Service Worker

## 🚀 Lancement en local

```bash
# 1. Installer les dépendances (~1 minute)
npm install

# 2. Lancer en développement
npm run dev

# 3. Ouvrir http://localhost:5173
```

## 📦 Build production

```bash
npm run build     # Génère le dossier dist/
npm run preview   # Prévisualise le build
```

Le dossier `dist/` produit est **déployable partout** :
- Cloudflare Pages
- Vercel
- Netlify
- GitHub Pages
- nginx / Apache
- Serveur statique quelconque

## 🌐 Déploiement Cloudflare Pages

```bash
npm run build
npx wrangler pages deploy dist --project-name=vanplanner-3d
```

## 🎮 Utilisation

### Premier lancement
Au tout premier chargement, le preset **"Nomade Full-Time"** est chargé automatiquement pour te montrer une scène riche. Tu peux ensuite :
- Cliquer sur **"Nouveau"** pour repartir de zéro
- Choisir un autre van dans la liste (dropdown en haut)
- Sélectionner un preset dans le menu **Presets**

### Manipulation
- **Clic sur un produit** du catalogue à gauche → l'ajoute au centre du van
- **Clic sur un objet** dans la scène → le sélectionne (voir onglet "Objet" à droite)
- **Molette + clic droit** : zoom + orbite dans la vue 3D
- **Clic gauche + glisser** : rotation caméra

### Interface
- **Barre supérieure** : nouveau/ouvrir/enregistrer, sélecteur van, presets, mode de rendu
- **Panneau gauche** : catalogue avec filtres par source (IKEA, Décathlon, Van, Électrique) et recherche
- **Vue centrale** : rendu 3D interactif du van et de l'aménagement
- **Panneau droit** : onglets Objet / Calques / Totaux / VASP

## 🧱 Stack technique

- **React 18 + TypeScript 5 + Vite 5**
- **Three.js + @react-three/fiber + @react-three/drei** (3D)
- **Zustand + persist middleware** (state + persistance localStorage)
- **Tailwind CSS** (UI)
- **Zod** (validation import/export)
- **Lucide React** (icônes)
- **react-hot-toast** (notifications)
- **vite-plugin-pwa** (Service Worker + Manifest)

## 📱 Installation PWA

Après avoir ouvert l'app dans Chrome/Edge :
1. Clique sur l'**icône ⊕** dans la barre d'adresse (ou menu ⋮ → "Installer")
2. L'app s'ajoute à ton bureau / launcher mobile
3. Ouvre-la comme une app native : **plein écran, offline, sans navigateur**

## 🔌 Mode offline

Une fois l'app chargée une première fois :
- Toutes les données (vans, catalogue, presets) sont en cache
- Tu peux couper ta connexion internet → l'app continue à fonctionner
- Les projets sont sauvegardés dans le localStorage du navigateur
- Le bandeau en bas indique l'état : ● En ligne / ● Hors ligne

## 📁 Structure du projet

```
vanplanner-3d/
├── src/
│   ├── App.tsx              (composant racine)
│   ├── main.tsx             (entry point)
│   ├── components/          (Toolbar, LeftPanel, RightPanel, Viewport)
│   ├── three/               (VanModel, ProductMesh)
│   ├── stores/              (Zustand : sceneStore)
│   ├── data/                (vans, catalog, presets)
│   ├── utils/               (serialize import/export)
│   └── styles/              (Tailwind + dark theme)
├── public/                  (favicon, icônes PWA)
├── vite.config.ts           (VitePWA config)
├── tailwind.config.js
├── tsconfig.json
└── package.json
```

## 🗺 Roadmap

Cette version est un **MVP fonctionnel autonome**. Les versions suivantes pourraient ajouter :

- 🖼 Modèles 3D GLTF réels pour les produits phares
- 🔺 Modèles 3D précis des vans (silhouettes reconnaissables)
- ⚡ Éditeur électrique nodal (react-flow) + calcul d'autonomie
- 🌡 Simulateur thermique (isolation, condensation, météo 30 villes)
- 📐 Export DXF/DWG pour CNC/menuisier avec nesting bin-packing
- 📄 Générateur PDF notice de montage (style IKEA)
- 📱 WebXR / AR mobile pour visualisation à l'échelle 1
- 🌐 Marketplace communautaire (backend Express + PostgreSQL)
- 🎬 Raytracing Blender/Cycles (backend Docker)

## ⚖️ Réglementation VASP

Le score VASP affiché est une **aide à la préparation**. La validation finale d'un aménagement en "Véhicule Automoteur Spécialisé — Caravane" relève exclusivement de la **DREAL** et d'un contrôle en **centre agréé**, conformément à l'arrêté du 5 novembre 1984 et à ses révisions successives.

## 📝 Licence

MIT — Ce projet est fourni tel quel, sans garantie. Les données constructeur sont issues d'informations publiques et arrondies. À vérifier avant toute fabrication réelle.

---

Bonne conception ! 🚐✨
