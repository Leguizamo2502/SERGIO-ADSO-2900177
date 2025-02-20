<?php
    include ('saludo.php');

    $saludo = new Saludo();
    $saludo->setSaludar('lola');
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saludo</title>
</head>
<body>
    <?php

    echo '<h1>'. $saludo->getSaludar().'</h1>';

    ?>
</body>
</html>