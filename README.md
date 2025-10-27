# Exercice 2 : Manipulation avancée des conteneurs

[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://www.docker.com/)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/malakzaidi/ZAIDI-ELHABTI-Tp1-exo2-docker)

<img width="1126" height="561" alt="image" src="https://github.com/user-attachments/assets/46416874-c75c-4935-a48a-a58218644d42" />


## 📋 Table des Matières

- [Description](#description)
- [Prérequis](#prérequis)
- [Structure du Projet](#structure-du-projet)
- [Installation](#installation)
- [Utilisation](#utilisation)
- [Référence des Commandes Docker](#référence-des-commandes-docker)
- [Configuration](#configuration)
- [Résolution des Problèmes](#résolution-des-problèmes)
- [Auteurs](#auteurs)
- [Licence](#licence)

## 📖 Description

Ce dépôt contient l'exercice 2 du Travail Pratique 1 (TP1) axé sur la conteneurisation avec Docker. Cet exercice démontre les concepts fondamentaux de Docker incluant :

- Création et gestion des conteneurs Docker
- Écriture de Dockerfiles efficaces
- Compréhension des images Docker et des couches (layers)
- Réseau de conteneurs et communication
- Gestion des volumes pour la persistance des données
- Docker Compose pour les applications multi-conteneurs

**Objectifs d'Apprentissage :**
- Maîtriser la gestion du cycle de vie des conteneurs Docker
- Comprendre la différence entre images et conteneurs
- Apprendre les bonnes pratiques pour la création de Dockerfiles
- Implémenter les bases de l'orchestration de conteneurs
- Travailler avec les volumes et réseaux Docker

## 🔧 Prérequis

Avant de commencer, assurez-vous d'avoir installé les éléments suivants sur votre système :

### Logiciels Requis

- **Docker Engine** (version 20.10 ou supérieure)
  - [Guide d'installation pour Linux](https://docs.docker.com/engine/install/)
  - [Guide d'installation pour Windows](https://docs.docker.com/desktop/install/windows-install/)
  - [Guide d'installation pour macOS](https://docs.docker.com/desktop/install/mac-install/)

- **Docker Compose** (version 2.0 ou supérieure)
  - Généralement inclus avec Docker Desktop
  - Pour Linux : Suivez le [guide d'installation officiel](https://docs.docker.com/compose/install/)

- **Git** (pour cloner le dépôt)

### Vérifier l'Installation

Vérifiez que Docker est correctement installé :

```bash
docker --version
docker-compose --version
```

Vérifiez que le daemon Docker fonctionne :

```bash
docker ps
```

### Connaissances Recommandées

- Connaissances de base en ligne de commande (bash/terminal)
- Compréhension basique des concepts de conteneurisation
- Familiarité avec Git et GitHub

## 📁 Structure du Projet

```
ZAIDI-ELHABTI-Tp1-exo2-docker/
├── Dockerfile              # Fichier de définition de l'image Docker
├── docker-compose.yml      # Configuration Docker Compose
├── .dockerignore          # Fichiers à exclure lors du build
├── src/                   # Code source de l'application
│   ├── app.py            # Application principale
│   └── requirements.txt  # Dépendances Python (si applicable)
├── config/               # Fichiers de configuration
│   └── nginx.conf       # Configuration serveur (si applicable)
├── data/                # Données persistantes
└── README.md            # Ce fichier
```

## 🚀 Installation

### Étape 1 : Cloner le Dépôt

```bash
git clone https://github.com/malakzaidi/ZAIDI-ELHABTI-Tp1-exo2-docker.git
cd ZAIDI-ELHABTI-Tp1-exo2-docker
```

### Étape 2 : Vérifier les Fichiers

Assurez-vous que tous les fichiers nécessaires sont présents :

```bash
ls -la
```

### Étape 3 : Construire l'Image Docker

Pour construire l'image Docker à partir du Dockerfile :

```bash
docker build -t tp1-exercice2 .
```

**Options utiles :**
- `-t tp1-exercice2` : Attribue un nom (tag) à l'image
- `.` : Spécifie le contexte de build (répertoire courant)
- `--no-cache` : Force la reconstruction sans utiliser le cache

### Étape 4 : Vérifier la Création de l'Image

```bash
docker images | grep tp1-exercice2
```

## 💻 Utilisation

### Méthode 1 : Utilisation de Docker

#### Lancer le Conteneur

```bash
docker run -d -p 8080:80 --name mon-conteneur tp1-exercice2
```

**Explication des options :**
- `-d` : Mode détaché (exécution en arrière-plan)
- `-p 8080:80` : Mappage de ports (hôte:conteneur)
- `--name mon-conteneur` : Nom du conteneur
- `tp1-exercice2` : Nom de l'image à utiliser

#### Vérifier que le Conteneur est en Cours d'Exécution

```bash
docker ps
```

#### Accéder à l'Application

Ouvrez votre navigateur et accédez à :
```
http://localhost:8080
```

#### Afficher les Logs

```bash
docker logs mon-conteneur
```

Pour suivre les logs en temps réel :
```bash
docker logs -f mon-conteneur
```

#### Arrêter le Conteneur

```bash
docker stop mon-conteneur
```

#### Supprimer le Conteneur

```bash
docker rm mon-conteneur
```

### Méthode 2 : Utilisation de Docker Compose

#### Lancer les Services

```bash
docker-compose up -d
```

**Options utiles :**
- `-d` : Mode détaché
- `--build` : Force la reconstruction des images
- `--force-recreate` : Force la recréation des conteneurs

#### Vérifier l'État des Services

```bash
docker-compose ps
```

#### Afficher les Logs

```bash
docker-compose logs -f
```

#### Arrêter les Services

```bash
docker-compose down
```

Pour arrêter et supprimer les volumes :
```bash
docker-compose down -v
```

## 📚 Référence des Commandes Docker

### Gestion des Images

```bash
# Lister toutes les images
docker images

# Supprimer une image
docker rmi <image-id>

# Supprimer toutes les images non utilisées
docker image prune -a

# Inspecter une image
docker inspect <image-name>
```

### Gestion des Conteneurs

```bash
# Lister les conteneurs en cours d'exécution
docker ps

# Lister tous les conteneurs (y compris arrêtés)
docker ps -a

# Démarrer un conteneur arrêté
docker start <container-name>

# Redémarrer un conteneur
docker restart <container-name>

# Exécuter une commande dans un conteneur en cours d'exécution
docker exec -it <container-name> /bin/bash

# Copier des fichiers depuis/vers un conteneur
docker cp <container-name>:/path/to/file /local/path
```

### Gestion des Volumes

```bash
# Lister les volumes
docker volume ls

# Créer un volume
docker volume create <volume-name>

# Inspecter un volume
docker volume inspect <volume-name>

# Supprimer un volume
docker volume rm <volume-name>

# Supprimer tous les volumes non utilisés
docker volume prune
```

### Gestion des Réseaux

```bash
# Lister les réseaux
docker network ls

# Créer un réseau
docker network create <network-name>

# Inspecter un réseau
docker network inspect <network-name>

# Connecter un conteneur à un réseau
docker network connect <network-name> <container-name>
```

### Nettoyage du Système

```bash
# Supprimer tous les conteneurs arrêtés, réseaux non utilisés, images pendantes et cache de build
docker system prune

# Nettoyage complet (attention : supprime tout ce qui n'est pas utilisé)
docker system prune -a --volumes
```

## ⚙️ Configuration

### Variables d'Environnement

Si votre application utilise des variables d'environnement, créez un fichier `.env` à la racine du projet :

```env
# Exemple de variables d'environnement
APP_PORT=8080
DATABASE_URL=postgresql://user:password@db:5432/mydatabase
DEBUG=false
SECRET_KEY=your-secret-key-here
```

### Personnalisation du Dockerfile

Le Dockerfile peut être personnalisé selon vos besoins. Voici un exemple de structure :

```dockerfile
# Image de base
FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de dépendances
COPY requirements.txt .

# Installer les dépendances
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code source
COPY . .

# Exposer le port
EXPOSE 80

# Commande de démarrage
CMD ["python", "app.py"]
```

### Personnalisation de Docker Compose

Exemple de fichier `docker-compose.yml` :

```yaml
version: '3.8'

services:
  web:
    build: .
    ports:
      - "8080:80"
    volumes:
      - ./data:/app/data
    environment:
      - DEBUG=false
    networks:
      - app-network
    restart: unless-stopped

  db:
    image: postgres:13
    environment:
      - POSTGRES_DB=mydatabase
      - POSTGRES_USER=user
      - POSTGRES_PASSWORD=password
    volumes:
      - postgres-data:/var/lib/postgresql/data
    networks:
      - app-network

networks:
  app-network:
    driver: bridge

volumes:
  postgres-data:
```

## 🔍 Résolution des Problèmes

### Problème : Le conteneur ne démarre pas

**Solution :**
1. Vérifier les logs :
   ```bash
   docker logs <container-name>
   ```
2. Vérifier la configuration du Dockerfile
3. S'assurer que les ports ne sont pas déjà utilisés

### Problème : Impossible de se connecter au conteneur

**Solution :**
1. Vérifier que le conteneur est en cours d'exécution :
   ```bash
   docker ps
   ```
2. Vérifier le mappage des ports :
   ```bash
   docker port <container-name>
   ```
3. Tester avec curl :
   ```bash
   curl http://localhost:8080
   ```

### Problème : L'image prend trop d'espace

**Solution :**
1. Utiliser une image de base plus légère (alpine)
2. Optimiser le Dockerfile (réduire le nombre de couches)
3. Utiliser `.dockerignore` pour exclure les fichiers inutiles
4. Nettoyer les images non utilisées :
   ```bash
   docker image prune -a
   ```

### Problème : Erreurs de permissions

**Solution :**
1. Vérifier les permissions des fichiers montés
2. Utiliser l'option `--user` lors de l'exécution :
   ```bash
   docker run --user $(id -u):$(id -g) ...
   ```

### Problème : Le build est très lent

**Solution :**
1. Utiliser le cache Docker efficacement
2. Ordonner les instructions du Dockerfile (des moins changeantes aux plus changeantes)
3. Utiliser des builds multi-stages si applicable
4. Vérifier la connexion internet pour le téléchargement des packages

## 📝 Bonnes Pratiques

1. **Dockerfiles :**
   - Utiliser des images de base officielles
   - Minimiser le nombre de couches
   - Ordonner les instructions par fréquence de changement
   - Ne pas installer de packages inutiles
   - Utiliser `.dockerignore`

2. **Sécurité :**
   - Ne jamais inclure de secrets dans les images
   - Utiliser des variables d'environnement pour les configurations sensibles
   - Maintenir les images à jour
   - Exécuter les conteneurs avec un utilisateur non-root quand possible

3. **Performance :**
   - Utiliser des images légères (alpine)
   - Nettoyer le cache des gestionnaires de paquets
   - Utiliser des builds multi-stages pour les applications compilées

4. **Maintenance :**
   - Taguer les images de manière significative
   - Documenter les changements
   - Utiliser des versions spécifiques pour les images de base

## 👥 Auteurs

- **ZAIDI Malak** - [GitHub](https://github.com/malakzaidi)
- **ELHABTI** - Contributeur

## 📄 Licence

Ce projet est réalisé dans le cadre d'un travail pratique académique.

## 📞 Support

Pour toute question ou problème :
- Ouvrir une [issue](https://github.com/malakzaidi/ZAIDI-ELHABTI-Tp1-exo2-docker/issues) sur GitHub
- Contacter les auteurs via GitHub

## 🙏 Remerciements

- Professeur du cours pour les instructions et le support
- Documentation officielle Docker
- Communauté Docker

---

**Note :** Ce README est un template générique. Veuillez l'adapter selon le contenu spécifique de votre exercice et les technologies utilisées dans votre projet.

