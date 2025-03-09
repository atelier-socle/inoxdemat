# Processus de Mise à Jour des Documents de Dématérialisation

## Contexte
Cette documentation décrit le processus de mise à jour des documents de dématérialisation pour les squads de la squad. Elle détaille les étapes nécessaires pour traiter les fichiers Excel et PDF afin de garantir leur conformité et leur intégration correcte dans le package Swift Package Manager (SPM).

## Présentation
Ce projet fournit un **package Swift Package Manager (SPM)** avec un **script shell d'installation** permettant d'initialiser la configuration de votre Mac. Il inclut également un **script de traitement d'un fichier Excel** utilisé pour mettre à jour la documentation dématérialisée des projets "ECV" et "ARE".

## Prérequis
Avant d'exécuter les scripts, assurez-vous que :
- Votre système est sous **macOS 15.0**.
- Vous avez installé **Swift 6**.
- Vous avez placé les fichiers requis dans les bons répertoires.

## Utilisation des Scripts

### 1. Script d'Installation
Pour initialiser la configuration du Mac pour la première fois, placez-vous dans le répertoire `.scripts/` et exécutez le script d'installation :

```sh
cd .scripts/
sh setup.sh
```

### 2. Traitement du Fichier Excel
Ce script convertit un **fichier Excel** fourni par l'équipe produit en un format conforme aux exigences du package. Il permet de :
- Vérifier et adapter le fichier Excel aux exigences techniques du package.
- Mettre à jour le fichier de référence `Documents.json` dans les ressources du package.
- Remplacer et actualiser les **fichiers Gherkin (.feature)** utilisés pour les tests fonctionnels BDD.
- Nettoyer et mettre à jour **les fichiers PDF** présents dans le dépôt.

#### Étapes pour Exécuter le Script

1. **Placer les fichiers requis** dans les bons répertoires :
   - **Fichier Excel :** Déplacez-le dans `.scripts/sources/excel/`
   - **Fichiers PDF :** Placez les fichiers PDF `Excelium` et `Ma Retraite` dans les répertoires dédiés :
     - `.scripts/sources/pdfs/Excelium/`
     - `.scripts/sources/pdfs/MaRetraite/`
2. **Se positionner dans le répertoire `.scripts/`** :

   ```sh
   cd .scripts/
   ```
3. **Exécuter le script en précisant le chemin du fichier Excel** :

   ```sh
   sh run.sh "sources/excel/repository.xlsx"
   ```

### 3. Étapes Post-Exécution
Une fois le script terminé :
- Les **fichiers PDF, `Documents.json` et les fichiers Gherkin (.feature)** seront mis à jour.
- Ouvrez **`Package.swift`** dans **Xcode**, puis **exécutez les tests (CMD + U)** pour vérifier leur bon fonctionnement.
- En cas d'échec des tests, **annulez tous les changements Git et recommencez la procédure**.
- Si les tests réussissent :
  - Exécutez `swiftformat .`
  - **Committez et créez une pull request** pour mettre à jour le dépôt distant.

## 🚨 Notes Importantes pour l'Équipe Produit
Le fichier **Excel fourni doit impérativement respecter les exigences techniques** suivantes :

✅ **Structure du fichier Excel** :
- **Ne pas modifier** les en-têtes du tableau ni les clés.
- **Respecter strictement** le format des cellules défini dans le modèle d'exemple.
- **Tous les champs doivent être remplis** – aucun champ ne doit être vide.
- **Aucun doublon de ligne** (même identifiant `id`) n'est autorisé.
- **Ne pas ajouter de lignes ou colonnes vides**.

📌 **Contenu du fichier Excel** :
- Le fichier **doit inclure l’ensemble des documents EN COURS et À VENIR**.
- **Tous les fichiers PDF doivent être fournis et correctement référencés**.
  - **Nom du fichier** sans caractères spéciaux, sans accents, et **sans extension `.pdf`**.

💡 **Non-respect de ces exigences** : toute erreur dans la structure du fichier peut entraîner un échec de l’exécution du script. Assurez-vous que le fichier transmis soit rigoureusement conforme avant de l’envoyer à l’équipe technique.

## 📂 Références des Dépôts Azure DevOps
Pour plus d’informations et accéder aux sources du projet, consultez les dépôts suivants :
- [InovDematerialisation SPM](https://www.google.com)
- [DigitalDocsCLI SPM](https://www.apple.com)
