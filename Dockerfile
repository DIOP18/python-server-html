FROM python:3.9-slim

# Définir le répertoire de travail
WORKDIR /app

# Copier le fichier server.py dans le conteneur
COPY app/server.py .

LABEL maintainer="diopsoda1812@gmail.com"
LABEL version="1.0"

# Exposer le port utilisé par l'application
EXPOSE 8000

# Démarrer le serveur
CMD ["python", "server.py"]
