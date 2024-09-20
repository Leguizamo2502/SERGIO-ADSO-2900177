<?php
class Valores {
    private $lado;
    private $base;
    private $altura;
    
    public function __construct($lado, $base, $altura) {
        $this->lado = $lado;
        $this->base = $base;
        $this->altura = $altura;
    }
    public function setLado($lado) {
        $this->lado = $lado;
    }
    public function setBase($base) {
        $this->base = $base;
    }
    public function setAltura($altura) {
        $this->altura = $altura;
    }
    public function getLado() {
        return $this->lado;
    }
    public function getBase() {
        return $this->base;
    }
    public function getAltura() {
        return $this->altura;
    } 
    
}

class Areas {
    private $valor;

    public $areaCuadrado;
    public $areaRectangulo;
    public $areaTriangulo;
    
    public function __construct(Valores $valor) {
        $this->valor = $valor;
    }
    public function areaCuad() {
        $this->areaCuadrado = $this->valor->getLado() * $this->valor->getLado();
        return $this->areaCuadrado;
    }
    public function areaRect() {
        $this->areaRectangulo = $this->valor->getBase() * $this->valor->getAltura();
        return $this->areaRectangulo;
    }
    public function areaTriangulo() {
        $this->areaTriangulo = $this->valor->getBase() * $this->valor->getAltura() / 2;
        return $this->areaTriangulo;
    }


}
?>