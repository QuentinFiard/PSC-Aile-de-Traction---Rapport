Note sur l'utilisation de Git pour le rapport PSC.

Commandes de base :

    - Initialisation du suivi de version : on se place dans le dossier contenant
    les fichiers dont ils faut suivre les différentes versions, et on exécute
    
	git init


    - Vous avez modifié des fichiers et souhaitez savoir lesquels ?
    
	git status
	
    vous affiche les modifications effectuées sur les fichiers suivis, et affiche également
    les nouveaux fichiers qui ne sont pas encore suivis (untracked files).




    - Vous avez modifié un fichier et souhaitez mettre vos modifs dans la prochaine
    version du rapport, ou vous avez créé un fichier que vous souhaitez suivre, deux
    étapes :
    
    Exécutez
	git add file 	// où file est le chemin d'accès au fichier
    
    pour chaque fichier modifié (vous pouvez exécuter git add directory où directory
    est le nom d'un dossier...). Plus rapide, "git add -A" ajoute tous les fichiers
    du dossier courant (mais vous devrez vérifier par "git status" que vous n'ajoutez
    pas de fichier inutiles -- pour ne pas pourrir le répertoire du serveur --,
    en exécutant par la suite "git reset file" sur de tels fichiers avant de continuer)
    
    A ce stade, exécuter "git status" affiche dans la section commit les fichiers
    que vous avez ajoutés. Il s'agit des fichiers dont la version sera sauvegardé
    par la prochaine commande :
    
	git commit -m "Commentaire de la modif"
	
    où Commentaire de la modif est une description rapide de la modif que vous
    venez d'effectuer (Exemple : correction d'une faute d'orthographe dans la
    partie X, avancement de la sous-partie Y...)
    
    Cette commande n'est à exécuter qu'une fois que vous êtes sûr que tous les
    fichiers que vous vouliez sauvegarder ont été ajouté (git add ...), et que
    vous êtes sûrs que vous n'ajoutez pas de fichiers inutiles.




    - Récupérer la dernière version du rapport :
	git fetch rapport
	git merge rapport-master

    Cette commande peut faire apparaitre des conflits (exemple : si deux personnes
    ont modifié le même fichier). En cas de conflit, Git affichera le nom des fichiers incompatibles.
    Il vous faut alors ouvrir ces fichiers un par un, et corriger les passages de la forme :
    
    <<<<<<< HEAD:nom_du_fichier
    Une phrase
    =======
    Une phrase modifiée
    >>>>>>> numéro_de_la_version:nom_du_fichier
    
    Vous choisissez quelle version est correcte en supprimant tout ce passage et en
    le remplaçant par la bonne version. Par exemple ici on souhaiterait garder
    "Une phrase modifiée", et on remplacerait donc
    
    <<<<<<< HEAD:nom_du_fichier
    Une phrase
    =======
    Une phrase modifiée
    >>>>>>> numéro_de_la_version:nom_du_fichier
    
    par
    
    Une phrase modifiée
    
    
    Une fois cette modification effectuée dans tous les fichiers (pour être sûr
    de ne pas en avoir oublier, la commande "git status" vous donne les noms
    des fichiers encore en conflits), vous exécutez
     
	"git add file"
    
    sur tous les fichiers qui étaient en conflit et que vous avez résolus (ou
    "git add -A" qui est plus rapide, mais attention à ne pas ajouter de fichiers
    inutiles). Puis vous exécutez
    
	git commit -m "Fusion des données du serveur"
	
    A ce stade, votre dossier contient la dernière version du rapport
    
    
    
    - Envoyer votre version du rapport sur le serveur.
    
	1. Première étape : récupérer les données du serveur, pour fusionner
	    vos fichiers avec ceux du serveur (voir étape précédente).
	    
	2. A ce stade vous avez résolu tous les conflits avec les fichiers du
	    serveur, pour envoyer votre version exécutez
	    
	    git push rapport
	    
	En l'absence d'erreur, votre version est maintenant la version du serveur.
	
	
Configuration :

git remote add rapport quentin.fiard@vanilla.polytechnique.fr:Rapport.git
