<?php
include('nomina.php');
$mostrarNomina = new Nomina();

echo "Salario: ".$mostrarNomina->calSalario()."<br>";
echo "Salud: ".$mostrarNomina->calSalud()."<br>";
echo "Pension: ".$mostrarNomina->calPension()."<br>";
echo "Arl: ".$mostrarNomina->calArl()."<br>";
echo "Descuento: ".$mostrarNomina->calDescuento()."<br>";
echo "SubTransporte: ".$mostrarNomina->calSubTransporte()."<br>";
echo "Retención: ".$mostrarNomina->calRetencion()."<br>";
echo "Pago total: ".$mostrarNomina->calPagoTotal()."<br>";
?>