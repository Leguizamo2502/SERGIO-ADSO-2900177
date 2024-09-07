<?php
include('figuras.php');
$area = new areaFigura();

echo "Área Cuadrado: ". $area->calcularAreaCuadrado(). "<br>";
echo "Área Rectángulo: ". $area->calcularAreaRectangulo(). "<br>";
echo "Área Triángulo: ". $area->calcularAreaTriangulo(). "<br>";


?>