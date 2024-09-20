<?php
include('main.php');
$num1 = new Numero(10);
$num2 = new Numero(5);

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
    echo "Suma: ". $num1->sumar($num2). "<br>";
    ?>
    
</body>
</html>