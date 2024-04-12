/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function factorial(pnumero){
    let numero = pnumero;
    let factorial = 1
    for(contar=1; contar<=numero; contar++){
    factorial = factorial*contar
}
    return factorial;
}

/**
 * constante 
 */
const factorial2=function(pnumero){
    let numero = pnumero;
    let factorial = 1
    for(contar=1; contar<=numero; contar++){
    factorial = factorial*contar
}
    return factorial;
}