/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calNum(pnumero){
    let numero = pnumero;
    let contador = 0;
    let resultadoC = ""
    while(contador<numero){
        contador++;
        resultadoC += contador+"\n";
    }
    return resultadoC;
}

/**
 * constante 
 */
const calNum2=function(pnumero){
    let numero = pnumero;
    let contador = 0;
    let resultadoC = ""
    while(contador<numero){
        contador++;
        resultadoC += contador+"\n";
    }
    return resultadoC;
}
