#!/bin/bash
# Exercice 2 - Manipulation avancée des conteneurs

# 1. Lancer conteneur Ubuntu
docker run -it --name ubuntu-exercice ubuntu bash

# 2. (dans le conteneur)
# apt update && apt install -y curl vim
# echo "=== Créé par Malak ===" > test.txt
# echo "Date : $(date)" >> test.txt
# Ctrl+P puis Ctrl+Q

# 3. Copier le fichier vers l’hôte
docker cp ubuntu-exercice:/test.txt ./fichiers/test.txt

# 4. Modifier le fichier sur l’hôte
echo "" >> ./fichiers/test.txt
echo "=== MODIFICATION ===" >> ./fichiers/test.txt
echo "Ajout depuis l’hôte" >> ./fichiers/test.txt

# 5. Replacer le fichier dans le conteneur
docker cp ./fichiers/test.txt ubuntu-exercice:/test.txt

# 6. Créer l’image personnalisée
docker commit ubuntu-exercice mon-ubuntu-custom:v1

# 7. Tester l’image
docker run -it --name test-image mon-ubuntu-custom:v1 bash
