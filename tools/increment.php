<html>
  <head>
    <title>increment</title>
    <meta charset="utf-8" />
  </head>
  <body>
    <?php
      $start = "urllib.urlretrieve('https://babel.hathitrust.org/cgi/imgsrv/download/pdf?id=coo.31924050382799;orient=0;size=100;seq=" ;
      $end = ";attachment=0', '";
      $name =".pdf')";
      $increment = 0;

      for ($i=0; $i < 644; $i++) {
        echo $start,++$increment,$end,$increment,$name;
        echo "<br />";
      }
    ?>
  </body>
</html>
