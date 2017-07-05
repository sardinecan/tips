<!DOCTYPE html>
<html xml:lang="fr">
  <head>
    <title>iiif Gallica</title>
    <meta charset="utf-8" />
  </head>
  <body>
    <p>
      <?php
      $url=$_POST['url'];
      $urlIiif=str_replace("gallica.bnf.fr/ark","gallica.bnf.fr/iiif//ark", $url);
      $urlNative=$urlIiif.'/full/full/0/native.jpg';
      echo $url;
      echo "<br />";
      echo "Votre lien vers le fichier haute résolution : <a href='".$urlNative."'>Fichier HD natif</a>";
      ?>
    </p>
  </body>
</html>
