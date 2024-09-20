<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Figuras</title>
</head>
<body>
    <?php
    include('figuras.php');
    $valores = new Valores(8, 8, 10);
    $areas = new Areas($valores);

    echo "Área del cuadrado: " . $areas->areaCuad() . "<br>";
    echo "Área del rectángulo: " . $areas->areaRect() . "<br>";
    echo "Área del triángulo: " . $areas->areaTriangulo() . "<br>";
    ?>
</body>
</html>