<!DOCTYPE html>
<html xml:lang="fr">
  <head>
    <title>iiif Gallica</title>
    <meta charset="utf-8" />
  </head>
  <body>
    <form action="urlGallica.php" method="post">
      <label>url Gallica</label>
      <input type="text" name="url" />
      <input type="submit" />
    </form>
    <p>
      <?php
        if (isset($_POST['url'])) {
          $url=$_POST['url'];
          //TODO ajouter la possibilité de supprimer automatiquement ".item.zoom" à la fin des urls.
          $urlIiif=str_replace("gallica.bnf.fr/ark", "gallica.bnf.fr/iiif//ark", $url);
          $urlIiif=str_replace(".item.zoom","",$urlIiif);
          $urlNative=$urlIiif.'/full/full/0/native.jpg';
          echo "Votre lien vers le fichier haute résolution : <a href='".$urlNative."'>Fichier HD natif</a>";
        }
      ?>
    </p>
  </body>
</html>
