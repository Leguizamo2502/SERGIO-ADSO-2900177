<?php
include('operaciones.php');
$operaciones= new operacion();

echo "Suma: " . $operaciones->sumar() . "<br>";
echo "Resta: " . $operaciones->restar() . "<br>";
echo "Multiplicación: " . $operaciones->multiplicar() . "<br>";
echo "División: " . $operaciones->dividir() . "<br>";

?>