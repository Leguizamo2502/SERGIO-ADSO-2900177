<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Operaciones</title>
</head>
<body>
    
    <?php
    include('main.php');
   
    $num1 = new Numero(10);
    $num2 = new Numero(5);
    
    $operaciones = new Operaciones($num1, $num2);
    
    
    $suma = $operaciones->sumar();
    $resta = $operaciones->restar();
    $multiplicacion = $operaciones->multiplicar();
    $division = $operaciones->dividir();
    
    
    echo "Número uno: " . $num1->getValor() . "<br>";
    echo "Número dos: " . $num2->getValor() . "<br><br>";
    
    echo "Suma: " . $suma . "<br>";
    echo "Resta: " . $resta . "<br>";
    echo "Multiplicación: " . $multiplicacion . "<br>";
    echo "División: " . $division . "<br>";
    ?>
    
</body>
</html>