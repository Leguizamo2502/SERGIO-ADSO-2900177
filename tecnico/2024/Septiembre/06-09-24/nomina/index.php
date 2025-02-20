<?php
include('nomina.php');
$nomina = new Nomina();
$nomina ->setVDia(50000);
$nomina -> setDTra(30);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nomina</title>
    <link rel="stylesheet" href="css/estiloNomina.css">
</head>
<body>
<?php

    echo'<div class="container">';
        echo 'Dias Trabajados: '.$nomina -> getDTra()."<br>";
        echo 'Valor dia: '.$nomina -> getVDia()."<br>";
        

        echo "Salario: ".$nomina->calSalario()."<br>";
        echo "Salud: ".$nomina->calSalud()."<br>";
        echo "Pension: ".$nomina->calPension()."<br>";
        echo "Arl: ".$nomina->calArl()."<br>";
        echo "Descuento: ".$nomina->calDescuento()."<br>";
        echo "SubTransporte: ".$nomina->calSubTransporte()."<br>";
        echo "Retención: ".$nomina->calRetencion()."<br>";
        echo "Pago total: ".$nomina->calPagoTotal()."<br>";
    echo'</div>';
?>
</body>
</html>
