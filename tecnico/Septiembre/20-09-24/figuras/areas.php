<?php

class Areas
{
    private $valor;

    public $areaCuadrado;
    public $areaRectangulo;
    public $areaTriangulo;

    public function __construct(Valores $valor)
    {
        $this->valor = $valor;
    }
    public function areaCuad()
    {
        $this->areaCuadrado = $this->valor->getLado() * $this->valor->getLado();
        return $this->areaCuadrado;
    }
    public function areaRect()
    {
        $this->areaRectangulo = $this->valor->getBase() * $this->valor->getAltura();
        return $this->areaRectangulo;
    }
    public function areaTriangulo()
    {
        $this->areaTriangulo = $this->valor->getBase() * $this->valor->getAltura() / 2;
        return $this->areaTriangulo;
    }
}
?>