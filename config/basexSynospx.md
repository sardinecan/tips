#Basex Synopsx

##Synopsx
###Organisation des dossiers
  - files : fichiers de l'application
  - Mapping : tout ce qui concerne la transformation d'un format à un autre
  - Modèle : tout ce qui concerne les modèles de contenu


##Basex
###Lancer le localhost
  - Lancer basexhttp
  - se connecter à http://localhost:8984

###Chargement d'une base de donnée xml
  - lancer basexgui
  - menu "database" > new
  - choisir le fichier maitre ; donner un nom à la base ; toutes les cases doivent être décochées
  - onglet parsing : cocher uniquement "Use XInclude"
  - onglet Indexes : cocher Text Index ; Attribute Index ; Token Index
  - onglet full-text : tout cocher sauf "stopword List" ; et choisir la langue.
  - onglet options : on ne touche à rien.
