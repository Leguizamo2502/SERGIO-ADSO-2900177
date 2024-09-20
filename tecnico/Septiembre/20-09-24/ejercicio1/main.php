<?php
class Numero {
    private $valor;

    public function __construct($valor) {
        $this->valor = $valor;
    }

    public function setValor($valor) {
        $this->valor = $valor; 
    }

    public function getValor() {
        return $this->valor;
    }
}

class Operaciones {
    private $numeroUno;
    private $numeroDos; 
    public $suma;
    public $resta;
    public $multiplicacion;
    public $division;

    public function __construct(Numero $numeroUno, Numero $numeroDos) {
        $this->numeroUno = $numeroUno;
        $this->numeroDos = $numeroDos;
    }

    public function sumar() {
        $this->suma = $this->numeroUno->getValor() + $this->numeroDos->getValor();
        return $this->suma;
    }

    public function restar() {
        $this->resta = $this->numeroUno->getValor() - $this->numeroDos->getValor();
        return $this->resta; 
    }

    public function multiplicar() {
        $this->multiplicacion = $this->numeroUno->getValor() * $this->numeroDos->getValor();
        return $this->multiplicacion; 
    }

    public function dividir() {
        $this->division = $this->numeroUno->getValor() / $this->numeroDos->getValor();
        return $this->division; 
    }
}
?>