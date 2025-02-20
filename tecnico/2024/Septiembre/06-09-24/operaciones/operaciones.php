<?php
class Numeros{
    public $numeroUno=10;
    public $numeroDos=5;
    public $suma;
    public $resta;
    public $multiplicacion;
    public $division;

    public function sumar(){
        $this->suma = $this->numeroUno+$this->numeroDos;
        return $this->suma;
    }
    public function restar(){
        $this->resta = $this->numeroUno+$this->numeroDos;
        return $this->resta;
    }
    public function multiplicar(){
        $this->multiplicacion = $this->numeroUno;
        return $this->multiplicacion;
    }
    public function dividir(){
        $this->division = $this->multiplicacion;
        return $this->division;
    }


}



?>