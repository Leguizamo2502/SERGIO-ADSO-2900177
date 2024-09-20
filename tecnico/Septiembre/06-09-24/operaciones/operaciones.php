<?php
class numeros{
    private $numeroUno;
    private $numeroDos;

    public function setNumeroUno($numeroUno){
        $this->numeroUno = $numeroUno;
    }
    public function getNumeroUno(){
        return $this->numeroUno;
    }
    public function setNumeroDos($numeroDos){
        $this->numeroDos = $numeroDos;
    }
    public function getNumeroDos(){
        return $this->numeroDos;
    }
}

class operacion{
    public $numeroUno;
    public $numeroDos;
    public $suma;
    public $resta;
    public $multiplicacion;
    public $division;



    public function ($numeroUno,$numeroDos){
        $this->resta = $numeroUno + $numeroDos;
        return $this->resta;
    }
    public function ($numeroUno,$numeroDos){
        $this->resta = $numeroUno - $numeroDos;
        return $this->resta;
    }
    public function ($numeroUno,$numeroDos){
        $this->multiplicacion = $numeroUno * $numeroDos;
        return $this->multiplicacion;
    }
    public function ($numeroUno,$numeroDos){
        $this->division = $numeroUno / $numeroDos;
        return $this->division;
    }

}



?>