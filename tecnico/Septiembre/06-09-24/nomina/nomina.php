<?php
class Nomina{
    public $vDia = 200000;
    public $dTra = 30;
    public $salario;
    public $salud;
    public $pension;
    public $arl;
    public $descuento;
    public $subTransporte;
    public $retencion;
    public $pagoTotal;

    public function calSalario(){
        $this->salario = $this->vDia * $this->dTra;
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
    public function calDescuento(){
        $this->descuento = $this->salud + $this->pension + $this->arl;
        return $this->descuento;
    }
    public function calSubTransporte(){
        if($this->salario < (2*1300000)){
            $this->subTransporte = 114000;
        } else {
            $this->subTransporte = 0;
        }
        return $this->subTransporte;
    }
    public function calRetencion(){
        if ($this->salario > (4*1300000)){
            $this->retencion = $this->salario * 0.04;
        }else{
            $this->retencion = 0;
        }
        return $this->retencion;
    }
    public function calPagoTotal(){
        $this->pagoTotal = ($this->salario + $this->subTransporte) - ($this->descuento + $this->retencion);
        return $this->pagoTotal;
    }
}
?>