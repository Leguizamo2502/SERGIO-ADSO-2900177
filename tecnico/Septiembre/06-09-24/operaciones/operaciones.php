<?php
class operacion{
    public $numeroUno = 5;
    public $numeroDos = 2;
    public $suma;
    public $resta;
    public $multiplicacion;
    public $division;

    public function sumar(){
        $this -> suma = $this->numeroUno + $this->numeroDos;
        return $this-> suma;
    }
    public function restar(){
        $this -> resta = $this->numeroUno - $this->numeroDos;
        return $this-> resta;
    }
    public function multiplicar(){
        $this -> multiplicacion = $this->numeroUno * $this->numeroDos;
        return $this-> multiplicacion;
    }
    public function dividir(){
        $this -> division = $this->numeroUno / $this->numeroDos;
        return $this-> division;
    }
}


?>