<?php
include('figuras.php');
$area = new areaFigura();

echo "Área Cuadrado: ". $area->calAreaCuadrado(). "<br>";
echo "Área Rectángulo: ". $area->calAreaRectangulo(). "<br>";
echo "Área Triángulo: ". $area->calAreaTriangulo(). "<br>";


?>