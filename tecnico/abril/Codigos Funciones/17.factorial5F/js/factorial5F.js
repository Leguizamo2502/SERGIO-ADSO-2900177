/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calFactorial(pnumero){
    let numero = pnumero;
    let contador = 0;
    let factorial = 1;
    while(contador<numero){
        contador= contador+1;
        factorial=factorial*contador;
    }
    return factorial;
    
}
/**
 * constante 
 */
const calFactorial2=function(pnumero){
    let numero = pnumero;
    let contador = 0;
    let factorial = 1;
    while(contador<numero){
        contador= contador+1;
        factorial=factorial*contador;
    }
    return factorial;
}