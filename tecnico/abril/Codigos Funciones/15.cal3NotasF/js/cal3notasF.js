/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function  calNota1(pnota1,pporcentaje1){
    let nota1=pnota1;
    let porcentaje1=pporcentaje1;
    let porcNota1=nota1*porcentaje1;
    return porcNota1;

}

function calNota2(pnota2,pporcentaje2){
    let nota2=pnota2;
    let porcentaje2=pporcentaje2;
    let porcNota2=nota2*porcentaje2;
    return porcNota2;
}

function calNota3(pnota3,pporcentaje3){
    let nota3=pnota3;
    let porcentaje3=pporcentaje3;
    let porcNota3=nota3*porcentaje3;
    return porcNota3;
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
        return "Nota Superior";
    }else if(psumaporc<4.5 && psumaporc >=3.5){
        return "Nota buena";
    }else if(psumaporc<3.5 && psumaporc>=3){
        return "Nota media";
    }else{
        return "Nota baja";
    }
    
}

/**
 * constante 
 */

const calNota12=function(pnota1,pporcentaje1){
    let nota1=pnota1;
    let porcentaje1=pporcentaje1;
    let porcNota1=nota1*porcentaje1;
    return porcNota1;

}

const calNota22=function(pnota2,pporcentaje2){
    let nota2=pnota2;
    let porcentaje2=pporcentaje2;
    let porcNota2=nota2*porcentaje2;
    return porcNota2;
}

const calNota32=function(pnota3,pporcentaje3){
    let nota3=pnota3;
    let porcentaje3=pporcentaje3;
    let porcNota3=nota3*porcentaje3;
    return porcNota3;
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
        return "Nota Superior";
    }else if(psumaporc<4.5 && psumaporc >=3.5){
        return "Nota buena";
    }else if(psumaporc<3.5 && psumaporc>=3){
        return "Nota media";
    }else{
        return "Nota baja";
    }
    
}