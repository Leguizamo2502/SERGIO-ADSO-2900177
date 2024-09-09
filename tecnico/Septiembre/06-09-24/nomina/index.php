<?php
include('nomina.php');
$nomina = new Nomina();

echo "Salario: ".$nomina->calSalario()."<br>";
echo "Salud: ".$nomina->calSalud()."<br>";
echo "Pension: ".$nomina->calPension()."<br>";
echo "Arl: ".$nomina->calArl()."<br>";
echo "Descuento: ".$nomina->calDescuento()."<br>";
echo "SubTransporte: ".$nomina->calSubTransporte()."<br>";
echo "Retención: ".$nomina->calRetencion()."<br>";
echo "Pago total: ".$nomina->calPagoTotal()."<br>";
?>