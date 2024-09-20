<?php
class Numero {
    private $valor;

    public function __construct($valor) {
        $this->valor = $valor;
    }

    public function setValor() {
        $this->valor;
    }
    public function getValor() {
        return $this->valor;
    }
}


class Operaciones {
    private $numeroUno;
    private $numeroDOs;
    public $suma;
    public $resta;
    public $multiplicacion;
    public $division;

    public function __construct(Numero $numeroUno, Numero $numeroDos) {
        $this->numeroUno = $numeroUno;
        $this->numeroDos = $numeroDos;
    }


}

?>