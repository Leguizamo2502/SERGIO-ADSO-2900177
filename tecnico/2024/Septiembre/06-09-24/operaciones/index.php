<?php
include('operaciones.php');
$operaciones = new Numeros();
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
    echo 'Suma: '. $operaciones->sumar().'<br>';
    echo 'Resta: '. $operaciones->restar().'<br>';
    echo 'Multiplicacion: '. $operaciones->multiplicar().'<br>';
    echo 'Division: '. $operaciones->dividir().'<br>';

    ?>
</body>
</html>