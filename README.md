# cv_flutter_divin

Application Flutter de présentation du CV, de la famille et des coordonnées de Divin Bahavu Bénédiction.

## Fonctionnalités

- Page de connexion avec identifiant et mot de passe masqué.
- Page CV : profil, formation, expériences, compétences, langues et centres d’intérêt.
- Page Famille : présentation des membres avec leur lien de parenté.
- Page Contact : coordonnées et profils en ligne.
- Navigation avec `NavigationBar` et possibilité de se déconnecter.

## Identifiants de démonstration

- Identifiant : `divin`
- Mot de passe : `1234`

Ces identifiants sont uniquement destinés à la démonstration scolaire. Pour une vraie application, il faut mettre en place une authentification sécurisée.

## Installation et lancement

```bash
flutter pub get
flutter run
```

## Personnalisation obligatoire avant la remise

1. Remplacer l’avatar par votre vraie photo.
2. Compléter les noms, photos et professions des membres de la famille dans `FamilyPage`.
3. Remplacer le numéro de téléphone, l’e-mail et les liens sociaux dans `ContactPage`.
4. Compléter les niveaux de langues, les compétences et les détails des projets/stages dans `HomePage`.
5. Vérifier les informations affichées et tester l’application.

## Captures d’écran

Après avoir lancé l’application sur un téléphone ou un émulateur, prenez une capture de chacune des quatre pages et placez les images dans le dossier `screenshots/` avec les noms suivants :

- `01-connexion.png`
- `02-accueil-cv.png`
- `03-famille.png`
- `04-contact.png`

Puis remplacez cette section par les images, par exemple :

```markdown
## Captures d’écran

![Connexion](screenshots/01-connexion.png)
![Accueil - CV](screenshots/02-accueil-cv.png)
![Famille](screenshots/03-famille.png)
![Contact](screenshots/04-contact.png)
```

**Important :** le dépôt doit contenir les quatre vraies captures d’écran. Les noms des fichiers seuls ne suffisent pas.

## Dépôt GitHub public

Créez un dépôt public nommé exactement `cv_flutter_divin`, puis exécutez dans le dossier du projet :

```bash
git init
git add .
git commit -m "Initialisation de l'application CV Flutter"
git branch -M main
git remote add origin https://github.com/VOTRE-PSEUDO/cv_flutter_divin.git
git push -u origin main
```

Remplacez `VOTRE-PSEUDO` par votre nom d’utilisateur GitHub.
