/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calFactorial(pnumero,pcontador,pfactorial){
    let numero = pnumero;
    let contador = pcontador;
    let factorial = pfactorial;
    while(contador<numero){
        contador= contador+1;
        factorial=factorial*contador;
    }
    return factorial;
    
}
/**
 * constante 
 */
const calFactorial2=function(pnumero,pcontador,pfactorial){
    let numero = pnumero;
    let contador = pcontador;
    let factorial = pfactorial;
    while(contador<numero){
        contador= contador+1;
        factorial=factorial*contador;
    }
    return factorial;
}