/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function  calNota(pnota,pporcentaje){
    let nota=pnota;
    let porcentaje=pporcentaje;
    let porcNota=nota*porcentaje;
    return porcNota;
}

function calSumaPorcentaje(pnota1,pnota2,pnota3){
    let nota1=pnota1;
    let nota2=pnota2;
    let nota3=pnota3;
    let suma=nota1+nota2+nota3;
    return suma;
}

function calTipo(psumaporc){
    let sumaporc = psumaporc;
    if(psumaporc>=4.5){
        return " Nota Superior";
    }else if(psumaporc<4.5 && psumaporc >=3.5){
        return " Nota buena";
    }else if(psumaporc<3.5 && psumaporc>=3){
        return " Nota media";
    }else{
        return " Nota baja";
    }
    
}

/**
 * constante 
 */

const calNota2=function(pnota,pporcentaje){
    let nota=pnota;
    let porcentaje=pporcentaje;
    let porcNota=nota*porcentaje;
    return porcNota;
}
const calSumaPorcentaje2=function(pnota1,pnota2,pnota3){
    let nota1=pnota1;
    let nota2=pnota2;
    let nota3=pnota3;
    let suma=nota1+nota2+nota3;
    return suma;
}

const calTipo2=function(psumaporc){
    let sumaporc = psumaporc;
    if(psumaporc>=4.5){
        return " Nota Superior";
    }else if(psumaporc<4.5 && psumaporc >=3.5){
        return " Nota buena";
    }else if(psumaporc<3.5 && psumaporc>=3){
        return " Nota media";
    }else{
        return " Nota baja";
    }
    
}