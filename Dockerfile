# Étape 1 : Utiliser une image Node.js officielle comme base
FROM node:16

# Étape 2 : Définir le répertoire de travail
WORKDIR /app

# Étape 3 : Copier les fichiers package.json et package-lock.json
COPY package*.json ./

# Étape 4 : Installer les dépendances
RUN npm install

# Étape 5 : Copier le reste des fichiers de l'application
COPY . .

# Étape 6 : Exposer le port sur lequel l'application fonctionne
EXPOSE 3000

# Étape 7 : Démarrer l'application
CMD ["npm", "start"]
