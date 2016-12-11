# Re-Install Sytem

## Activation de TRIM pour les SSD
La fonction TRIM pour les SSD est activée sur les macs équipés à l'origine d'un SSD. Si un changement de disque à été effectué :
* Dans le terminal : `sudo trimforce enable` ;
* L'ordinateur reboot.

## Personnalisation du terminal Mac
### Personnalisation du profil
* Charger le profil : `terminalMac.terminal`

### Personnalisation du prompt
Créer un symlink à partir de /tips/config/.bash_profile
* Dans le terminal : `ln -s /Volumes/data/Github/tips/config/.bash_profile .bash_profile` ;
* puis : `source .bash_profile`

### Modification du hostName
* Dans le terminal : `sudo scutil --set HostName nouveauHostName`

## Logiciels
### Navigateurs
* [firefox](https://www.mozilla.org/fr/firefox/new/)
* [chrome](https://www.google.fr/chrome/browser/desktop/)

### Editeurs de texte
#### Atom.io
[télécharger Atom](https://atom.io/)

##### Packages
* [Sublime-Style-Column-Selection](https://atom.io/packages/Sublime-Style-Column-Selection)
* [atom-beautify](https://atom.io/packages/atom-beautify)
* [atom-wrap-in-tag](https://atom.io/packages/atom-wrap-in-tag)
* [autoclose-html](https://atom.io/packages/autoclose-html)
* [highlight-selected](https://atom.io/packages/highlight-selected)
* [lipsum](https://atom.io/packages/lipsum)
* [markdown-pdf](https://atom.io/packages/markdown-pdf)
* [minimap](https://atom.io/packages/minimap)
* [pigments](https://atom.io/packages/pigments)
* [todo-show](https://atom.io/packages/todo-show)

##### Installation dans le shell
* Menu : `Atom/Install Shell Commands`

##### Interface
###### Changement de la langue du dictionnaire
* Menu `Atom/préférences/packages/spell-check/settings`, dans le champ `locales` : `fr-FR`.

#### Oxygen XML editor
##### Interface
* Télécharger [Oxygen](https://www.oxygenxml.com/) ;
* dans le menu préférences/apparence : importer `oxygenTheme.xml`
* dans préférences/Éditeur : `cocher afficher les marqueurs TAB/NBSP/EOL/EOF` et `afficher les espaces`
* dans préférences/Éditeur/vérification orthographique :
`langue par défaut : français` ; décocher `utiliser les attributs lang et xml:lang` ; cocher dans vérification orthographique XML dans : `commentaires, texte, CDATA` ; dans options, cocher : tout cocher sauf `ignorer les doublons` et `ignorer les mots contenant un mélange majuscules/miniscules` ;
* dans préférences/Éditeur/formatage : décocher `Smart Enter` ; cocher : `indenter avec entrée, formater et indenter le document à l'ouverture, Saut de ligne réel` ; dans le champ `longueur de ligne : 10000`.

### Dev
#### Git
* Télécharger [git](https://git-scm.com/) ;
* dans le terminal : `git config --global user.name "Nom d'utilisateur"` ;
* puis : `git config --global user.email adresse@mail` ;
* pour configurer l'éditeur de texte par défaut : `git config --global core.editor atom` ;
* pour choisir l'outil de différence (en cas de conflit) : `git config --global merge.tool vimdiff`

#### Node.js
* Télécharger [Node.js](https://nodejs.org/en/)

#### Apache/MySQL/PHP
* [Tutoriel original](https://coolestguidesontheplanet.com/get-apache-mysql-php-and-phpmyadmin-working-on-macos-sierra/)

##### Apache
Apache est préinstallé sous macOs.
Commande (terminal) Apache :
* lancement : `sudo apachectl start`
* arrêt : `sudo apachectl stop`
* redémarrage : `sudo apachectl restart`
* Version : `httpd -v`

Après avoir lancé Apache, la page [localhost](http://localhost) doit afficher « **It Works !** »

##### Document root
*document root* correspond au répertoire où sont stockés les données des sites.
Par défaut, on y accède par l'adresse : [http://localhost](http://localhost), et les données sont partagées à partir du répertoire : `/Library/WebServer/Documents/`.

Historiquement, macOs disposait d'un deuxième répertoire aujourd'hui manquant : `~/Sites`.

Pour le créer (terminal) :
* On se place à la racine :  `cd ~` ;
* on créé le dossier *Sites* : `mkdir Sites`

Il faut maintenant configurer le système pour le rendre utilisable.

**création d'un fichier username.conf**

* Ce fichier doit être créé dans le répertoire `/etc/apache2/users/` : `cd /etc/apache2/users/`
* création du ficher **username.conf** *(note : il faut remplacer __username__ par le nom du compte, pour le connaître : `whoami` dans le terminal)* : `sudo atom username.conf` ;
* copier le morceau de code suivant en prenant soin de changer *username* de même que plus haut :
```xml
<Directory "/Users/username/Sites/">
AllowOverride All
Options Indexes MultiViews FollowSymLinks
Require all granted
</Directory>
```
* la permission que ce fichier doit être équivalente à  : `-rw-r--r--   1 root  wheel  298 Jun 28 16:47 username.conf` (cmde `ls -l` pour vérifier les permissions)
  * si elle ne correspond pas : `sudo chmod 644 username.conf`

**Configuration du fichier httpd.conf**

* Ouvrir le fichier **httpd.conf** : `sudo atom /etc/apache2/httpd.conf`
* Décommenter les modules suivants (les deux premiers devraient l'être sur une *clean install*) :
  * `LoadModule authz_core_module libexec/apache2/mod_authz_core.so`
  * `LoadModule authz_host_module libexec/apache2/mod_authz_host.`
  * `LoadModule userdir_module libexec/apache2/mod_userdir.so`
  * `LoadModule include_module libexec/apache2/mod_include.so`
  * `LoadModule rewrite_module libexec/apache2/mod_rewrite.so`
  * pour prendre un peu d'avance, nous en profiterons pour décommenter les modules suivants :
    * `LoadModule php5_module libexec/apache2/libphp5.so`
    * `Include /private/etc/apache2/extra/httpd-userdir.conf`
    * changer `AllowOverride None` en `AllowOverride All`
* sauvegarder.

Il reste un autre fichier de configuration Apache à modifier : **httpd-userdir.conf**

* ouvrir le fichier : `sudo atom /etc/apache2/extra/httpd-userdir.conf`
* décommenter la ligne : `Include /private/etc/apache2/users/*.conf`
* Sauvegarder et relancer Apache : `sudo apachectl restart`
* Le nouveau document root doit être accessible à l'adresse : [http://localhost/~username/](http://localhost/~username/)

##### PHP

PHP doit être opérationnel. Pour vérifier, créer une page **phpinfo.php** dans le document root : `echo  '<?php phpinfo(); ?>' > ~/Sites/config/index.php`, puis se rendre à l'adresse : [http://localhost/~username/config/](http://localhost/~username/config/) ; le php info doit s'afficher.

##### MySQL

Pour télécharger MySQL => [DMG archive](http://dev.mysql.com/downloads/mysql/)
Lancer ensuite l'installation à partir de l'archive téléchargée. À la fin de l'installation une fenêtre s'ouvre avec un mot de passe temporaire pour MySQL ; le copier, nous allons le changer.

###### Changement du MDP MySQL
* ajouter, s'il n'y est pas déjà, le $PATH dans .bash_profile : `export PATH=$PATH:/usr/local/mysql/bin` ou `export PATH="/usr/local/mysql/bin:$PATH"`
* Si erreur : `sudo /usr/local/mysql/support-files/mysql.server restart`
* arrêter MySQL : `sudo /usr/local/mysql/support-files/mysql.server stop`
* lancer MySQL en *safe mode* : `sudo mysqld_safe --skip-grant-tables`
* Laisser s'exécuter le processus, ouvrir un nouveau terminal et se connecter sans mot de passe comme utilisateur *root* : `mysql -u root`
* `FLUSH PRIVILEGES;`
* `ALTER USER 'root'@'localhost' IDENTIFIED BY 'Nouveau mot de passe';` (note il faut maintenir les guillemets simple.)
* quitter, `\q`, puis fermer les deux terminaux.
* lancer **MySQL** puis dans le terminal taper : `mysql -v -uroot -p` pour avoir la version de MySQL.

###### solutionner l'erreur 2002 MySQL Socket
dans le terminal rentrer ces deux commandes :
* `sudo mkdir /var/mysql`
* `sudo ln -s /tmp/mysql.sock /var/mysql/mysql.sock`

##### PHP MyAdmin
* télécharger [PHP MyAdmin](https://www.phpmyadmin.net/downloads/), puis copier le dossier phpmyadmin dans le dossier `~/Sites`
* créer le fichier de configuration : `mkdir ~/Sites/phpmyadmin/config`
* changer les permissions : `chmod o+w ~/Sites/phpmyadmin/config`
* se connecter à l'adresse [http://localhost/~username/phpmyadmin/setup/ ](http://localhost/~username/phpmyadmin/setup/) (MySQL doit être lancé)
* cliquer sur `nouveau serveur`
* dans l'onglet `type d'authentification`, renseigner les champs **root** et **mot de passe** (mot de passe MySQL), puis `appliquer`
* changer la langue de configuration si besoin, puis sauvegarder.
* Copier maintenant le fichier `phpmyadmin/config/config.inc.php` dans le dossier `phpmyadmin/` et supprimer le dossier `config`.
