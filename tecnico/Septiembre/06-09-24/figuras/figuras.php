<?php
class areaFigura{
    public $ladoCuadrado =3;
    public $areaCuadrado;
    public $alturaRectangulo=3;
    public $baseRectangulo=5;
    public $areaRectangulo;
    public $alturaTriangulo=3;
    public $baseTriangulo=5;
    public $areaTriangulo;

    public function calAreaCuadrado(){
        $this->areaCuadrado = $this->ladoCuadrado * $this->ladoCuadrado;
        return $this->areaCuadrado;
    }
    public function calAreaRectangulo(){
        $this->areaRectangulo = $this->baseRectangulo * $this->alturaRectangulo;
        return $this->areaRectangulo;
    }
    public function calAreaTriangulo(){
        $this->areaTriangulo = ($this->baseTriangulo * $this->alturaTriangulo) / 2;
        return $this->areaTriangulo;
    }

}

?>