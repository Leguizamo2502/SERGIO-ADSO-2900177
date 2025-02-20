/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calEdad(pfecNac, pfecAct){
    let edad;
    let fecNac = pfecNac;
    let fecAct = pfecAct;
    edad = fecAct - fecNac;
    if (edad >=18){
        return edad +" Es mayor de edad";
    }else{
        return edad +" No es mayor de edad";
    }
}

/**
 * constante 
 */

const calEdad2 = function(pfecNac, pfecAct){
    let edad;
    let fecNac = pfecNac;
    let fecAct = pfecAct;
    edad = fecAct - fecNac;
    if (edad >=18){
        return edad +" Es mayor de edad";
    }else{
        return edad +" No es mayor de edad";
    }
}