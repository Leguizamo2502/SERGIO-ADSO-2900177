<?php
    class Saludo{
        private $saludar;
        
        public function setSaludar($saludar): void{
            $this->saludar = $saludar;
        }
        public function getSaludar(): mixed{
           return $this->saludar;
        }

    }
?>