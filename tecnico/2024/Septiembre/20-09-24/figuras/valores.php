<?php
class Valores
{
    private $lado;
    private $base;
    private $altura;

    public function __construct($lado, $base, $altura)
    {
        $this->lado = $lado;
        $this->base = $base;
        $this->altura = $altura;
    }
    public function setLado($lado)
    {
        $this->lado = $lado;
    }
    public function setBase($base)
    {
        $this->base = $base;
    }
    public function setAltura($altura)
    {
        $this->altura = $altura;
    }
    public function getLado()
    {
        return $this->lado;
    }
    public function getBase()
    {
        return $this->base;
    }
    public function getAltura()
    {
        return $this->altura;
    }
}
?>