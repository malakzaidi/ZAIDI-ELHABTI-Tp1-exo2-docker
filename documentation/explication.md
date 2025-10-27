### 📄 **`documentation/exercice-complet.md`**

````markdown
# 🐳 Exercice 2 – Manipulation avancée des conteneurs Docker

## 🕒 Durée estimée
35 minutes

## 🎯 Contexte
Exploration des fonctionnalités avancées de Docker : manipulation d’un conteneur Ubuntu, transfert de fichiers entre le conteneur et l’hôte, création d’une image personnalisée et observation des ressources en temps réel.

---

## ⚙️ Étape 1 – Lancer un conteneur Ubuntu en mode interactif

```bash
docker run -it --name ubuntu-exercice ubuntu bash
````

**Explication :**

* `-it` : mode interactif pour accéder au terminal du conteneur.
* `--name` : donne un nom au conteneur (`ubuntu-exercice`).
* `ubuntu` : image utilisée.
* `bash` : ouvre un terminal Bash dans le conteneur.

---

## 🧰 Étape 2 – Installer `curl` et `vim` dans le conteneur

Une fois à l’intérieur du conteneur :

```bash
apt update
apt install -y curl vim
```

**Explication :**
On met à jour la liste des paquets et on installe les outils nécessaires.

---

## 📝 Étape 3 – Créer un fichier `test.txt` avec du contenu

```bash
echo "=== CRÉÉ PAR MALAK ===" > test.txt
echo "Date : $(date)" >> test.txt
cat test.txt
```

**Résultat attendu :**

```
=== CRÉÉ PAR MALAK ===
Date : Mon Oct 27 09:30:00 2025
```

---

## 🚪 Étape 4 – Sortir du conteneur sans l’arrêter

Appuyer sur :

```
Ctrl + P puis Ctrl + Q
```

**Explication :**
Cette combinaison permet de **détacher le terminal** tout en laissant le conteneur actif.

Vérifiez qu’il tourne toujours :

```bash
docker ps
```

---

## 📂 Étape 5 – Copier `test.txt` du conteneur vers la machine hôte

Sur ta machine locale :

```bash
mkdir -p fichiers
docker cp ubuntu-exercice:/test.txt ./fichiers/test.txt
```

**Explication :**
`docker cp` permet de transférer un fichier entre un conteneur et l’hôte.

---

## ✏️ Étape 6 – Modifier le fichier sur la machine hôte

```bash
echo "" >> ./fichiers/test.txt
echo "=== MODIFICATION SUR L'HÔTE ===" >> ./fichiers/test.txt
echo "Ajout d'informations depuis l’extérieur" >> ./fichiers/test.txt
cat ./fichiers/test.txt
```

---

## 🔁 Étape 7 – Replacer le fichier modifié dans le conteneur

```bash
docker cp ./fichiers/test.txt ubuntu-exercice:/test.txt
```

Reconnecte-toi dans le conteneur :

```bash
docker exec -it ubuntu-exercice bash
```

Vérifie :

```bash
cat test.txt
```

**Résultat attendu :**

```
=== CRÉÉ PAR MALAK ===
Date : Mon Oct 27 09:30:00 2025
=== MODIFICATION SUR L'HÔTE ===
Ajout d'informations depuis l’extérieur
```

---

## 🧱 Étape 8 – Créer une image à partir du conteneur modifié

```bash
docker commit ubuntu-exercice mon-ubuntu-custom:v1
```

**Explication :**

* `docker commit` crée une **nouvelle image** basée sur un conteneur existant.
* `mon-ubuntu-custom:v1` : nom et version de l’image.

Vérifie :

```bash
docker images
```

---

## 🚀 Étape 9 – Lancer un nouveau conteneur à partir de l’image personnalisée

```bash
docker run -it --name test-image mon-ubuntu-custom:v1 bash
```

Vérifie le contenu et les outils :

```bash
cat test.txt
curl --version
vim --version
```

---

## ✅ Étape 10 – Vérifier les modifications sans ouvrir le conteneur

```bash
docker run --rm mon-ubuntu-custom:v1 bash -c "cat test.txt"
```

**Explication :**

* `--rm` : supprime automatiquement le conteneur après exécution.
* `bash -c` : exécute la commande à l’intérieur du conteneur.

---

## 📊 Bonus – Explorer les statistiques en temps réel

```bash
docker stats
```

**Exemple de sortie :**

```
CONTAINER ID   NAME              CPU %     MEM USAGE / LIMIT   NET I/O
a1b2c3d4e5f6   ubuntu-exercice   0.13%     42.5MiB / 1.94GiB   1.2kB / 0B
```

---

## 🧹 Nettoyage (facultatif)

Pour supprimer tout à la fin :

```bash
docker stop ubuntu-exercice test-image
docker rm ubuntu-exercice test-image
docker rmi mon-ubuntu-custom:v1
```

## 👩‍💻 Auteur

**Nom :** Malak Zaidi 
**Filière :** Master en Systèmes Distribués et Intelligence Artificielle
**Date :** 27 Octobre 2025
**Outils utilisés :** Docker, Ubuntu, Bash

---

✅ **Conclusion :**
Cet exercice m’a permis de mieux comprendre la gestion des conteneurs Docker :

* Interaction entre conteneur et hôte
* Création d’images personnalisées
* Observation des ressources en temps réel

