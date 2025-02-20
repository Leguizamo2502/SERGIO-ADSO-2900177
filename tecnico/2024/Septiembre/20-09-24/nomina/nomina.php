<?php

class Nomina {
    private $valor;
    public $salario;
    public $salud;
    public $pension;
    public $arl;
    public $descuento;
    public $subTransporte;
    public $retencion;
    public $pagoTotal;

    public function __construct(Datos $valor){
        $this->valor = $valor;
    }

    public function calSalario(){
        $this->salario = $this->valor->getTotalDias() * $this->valor->getValorDia();
        return $this->salario;
    }
    public function calSalud(){
        $this->salud = $this->salario * 0.12;
        return $this->salud;
    }
    public function calPension(){
        $this->pension = $this->salario * 0.16;
        return $this->pension;
    }    
    public function calArl(){
        $this->arl = $this->salario * 0.052;
        return $this->arl;
    }
    public function descuento(){
        $this->descuento = $this->salud + $this->pension+ $this->arl;
        return $this->descuento;
    }

    public function calSubTransporte(){
        $smn = 1300000;
        if($this->salario<($smn*2)){
            $this->subTransporte=114000;
        }else{
            $this->subTransporte =0;
        }
        return $this->subTransporte;
    }
    public function calRetencion(){
        $smn = 1300000;
        if($this->salario>($smn*4)){
            $this->retencion=$this->salario*0.04;
        }else{
            $this->retencion =0;
        }
        return $this->retencion;
    }

    public function calPagoTotal(){
        $this->pagoTotal = ($this->salario + $this->subTransporte) - ($this->descuento + $this->retencion);
        return $this->pagoTotal;
    }

}
?>