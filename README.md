ETAPE1:
CREER LE PROJET EN RESPECTANT LA STRUCTURE
->Créer un fichier server.py qui met en place un serveur HTTP basique et importons le module http.server de Python. 
->Configurer le fichier Dockerfile pour indiquez la liste de toutes les librairies qu'on vas utilisez
->Fournir un fichier docker-compose.yml pour faciliter le déploiement grace a la specification du port ici c'est le port 8000 qui est utilisé et du repertoire par defaut app c'est pourquoi la requete pour executer avec docker-compose est beaucoup plus simple que celle avec docker.

->dans le terminal de docker ou cmd je spécifie le chemin de mon projet 
 cd Desktop\basic-docker-project
 puis avec docker-compose j'écris la commande 
 -> docker-compose up  pour executer notre projet

 Contrairement avec docker la commande n'est pas pareil il faut specifier le port et le nom de l'image

 dabord on specifie limage docker 

 -> docker build -t python-http-server .

 puis on execute le conteneur

 ->docker run -p 8000:8000 python-http-server

 Apres avoir executer le conteneur nous pouvons nous rendre dans le port 8000 de notre navigateur localhost:8000 pour voir notre fichier html qui affiche HELLO DOCKER!
 ![alt text](<Capture d'écran 2025-03-15 005445.png>)image du port 8000 et du message affiché.


ETAPE2: 
Partie B : Pousser l’image de l’application vers DockerHub

Alors pour pousser notre image vers dockerhub (qui est comme un github pour docker il permet de stocker les images de docker et de pouvoir les telecharger depuis nimporte quel environnement)

-> dabord dans le fichier dockerfile il faut ajouter les lignes LABEL

LABEL maintainer="diopsoda1812@gmail.com"
LABEL version="1.0"

le label maintainer: specifie que diopsoda.. est le proprietaire de cette image et version 1.0 est la version de mon image

Puis creer un compte DOCKERHUB sur internet avec email et password

1.Construire une image Docker de l'application. 

-> aller dans votre invité de commande taper la commande 

..>docker build -t python-http-server .

Cette commande est pour creer une image locale basée sur notre Dockerfile. -t permet de nommer mon image. Et le . indique que notre fichier dockerfile est dans le meme dossier

2. Se connecter à DockerHub via la ligne de commande.

->Apres nous devons nous connecter à dockerHub en tapant sur linvite de commande

->docker login 

on sera ensuite rediriger vers le navigateur dans dockerhub pour specifier nos informations de connections

3.• Taguer l’image Docker pour qu’elle soit prête à être poussée sur DockerHub.

-> S'en suit la commande 

..>docker tag python-http-server diop18/python-http-server:latest

Ici diop18 est le nom d'utilisateur pour mon dockerhub 
Pour pousser mon image vers dockerhub je dois dabord la taguer avec mon nom d'utilisateur et cest a ca que sert cette commande taguer mon image 

4. Pousser l’image sur DockerHub pour la rendre accessible en ligne. 

->Par la suite je push mon image dans le dockerhub avec la commande 

..>docker push diop18/python-http-server:latest

ENFIN JE vérifie dans dockerhub si mon image est bien pusher 

![alt text](<Capture d'écran 2025-03-15 024037.png>)voici une photo de mon image pyhton-http-server dans mon dockerhub

Puis pour verifier si tous était correct jai taper cette commande dans mon terminal

docker pull diop18/python-http-server:latest

Cette commande est fait pour pouvoir telecharger et utiliser l'image depuis nimporte quel environnement
