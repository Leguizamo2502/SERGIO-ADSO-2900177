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
    return edad;
}

function calMayor(pedad){
    let edad = pedad;
    if(edad>=18){
        return edad+" Es mayor de edad:";
    }else{
        return edad+" No es mayor de edad";
    }
}

function promedio(pedad1,pedad2,pedad3){
    let edad1 = pedad1;
    let edad2 = pedad2;
    let edad3 =pedad3;
    let promedio = (edad1+edad2+edad3)/3;
    return promedio;
}



/**
 * constante 
 */
const calEdad2=function(pfecNac, pfecAct){
    let edad;
    let fecNac = pfecNac;
    let fecAct = pfecAct;
    edad = fecAct - fecNac;
    return edad;
}

const calMayor2=function(pedad){
    let edad = pedad;
    if(edad>=18){
        return edad+" Es mayor de edad:";
    }else{
        return edad+" No es mayor de edad";
    }
}

const promedio2 =function(pedad1,pedad2,pedad3){
    let edad1 = pedad1;
    let edad2 = pedad2;
    let edad3 =pedad3;
    let promedio = (edad1+edad2+edad3)/3;
    return promedio;
}