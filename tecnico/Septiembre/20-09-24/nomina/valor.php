<?php
class Datos
{
    private $totalDias;
    private $valorDia;

    public function __construct($totalDias, $valorDia)
    {
        $this->totalDias = $totalDias;
        $this->valorDia = $valorDia;
    }
    public function setTotalDias($totalDias)
    {
        $this->totalDias = $totalDias;
    }
    public function getTotalDias()
    {
        return $this->totalDias;
    }
    public function setValorDia($valorDia)
    {
        $this->valorDia = $valorDia;
    }
    public function getValorDia()
    {
        return $this->valorDia;
    }
}
?>
