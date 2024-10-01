<?php
include('valores.php');
include('areas.php');
$valores = new Valores(8, 8, 10);
$areas = new Areas($valores);
$response = [];

$response['cuadrado'] = $areas->areaCuad();
$response['rectangulo'] = $areas->areaRect();
$response['triangulo'] = $areas->areaTriangulo();

// echo "Área del cuadrado: " . $areas->areaCuad() . "<br>";
// echo "Área del rectángulo: " . $areas->areaRect() . "<br>";
// echo "Área del triángulo: " . $areas->areaTriangulo() . "<br>";


header('Content-Type: application/json');
echo json_encode($response);
