<?php
include('valor.php');
include('nomina.php');

$valores = new Datos(30, 50000);
$nomina = new Nomina($valores);

$response = [];

$response['salario'] = $nomina->calSalario();
$response['salud'] = $nomina->calSalud();
$response['pension'] = $nomina->calPension();
$response['arl'] = $nomina->calArl();
$response['descuento'] = $nomina->descuento();
$response['subTransporte'] = $nomina->calSubTransporte();
$response['retencion'] = $nomina->calRetencion();
$response['pagoTotal'] = $nomina->calPagoTotal();

header('Content-Type: application/json');
echo json_encode($response);
