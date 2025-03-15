Tout dabord creer un repo github et y pousser le code actuel
git init
git add .
git commit -m "dockerhub"
git branch -M main
git remote add origin https://github.com/DIOP18/python-server-html.git
git push -u origin main

ensuite creer le fichier .github/workflows/docker-publish.yml qui est le fichier de  configuration pour GitHub Actions qui définit le pipeline CI/CD. Il utilise le dockerfile pour construire l'image docker 
context: .
Cette ligne indique à GitHub Actions de chercher le Dockerfile à la racine du projet et de l'utiliser pour construire l'image.

. Configurer les secrets dans GitHub

Sur la page du repository GitHub, cliquez sur "Settings"
Dans le menu de gauche, cliquez sur "Secrets and variables" puis "Actions"
Cliquez sur "New repository secret"
Ajoutez les secrets suivants :

Nom : DOCKERHUB_USERNAME, Valeur : votre nom d'utilisateur DockerHub
Nom : DOCKERHUB_TOKEN, Valeur : votre token d'accès DockerHub

Pour le DOCKERHUB_TOKEN il faut se rendre dans les settings de notre dockerhub cliquez sur personnal acces token et generer un token en mode read-write 

puis coller ce token au dockerhub token dans github 

Enfin poussons les modifications dans github 
git add .github/workflows/docker-publish.yml readme3.md
git commit -m "Pipeline cicd"
git push -u origin main

Verifions l'éxécution de notre workflows dans longlet action de notre repo 
Nous devons voir notre workflow en cours d'exécution ou terminé
Une fois terminé avec succès, vérifions notres compte DockerHub pour confirmer que l'image a été poussée