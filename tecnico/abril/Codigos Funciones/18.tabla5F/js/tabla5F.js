/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calTabla(pnumero){
    let numero = pnumero;
    let contador = 0;
    let multiplicacion = 0;
    let resultado="";
    while (contador < 5) {
        contador = contador + 1;
        multiplicacion = numero * contador;
        resultado += numero + " x " + contador + " = " + multiplicacion+"\n";
    }
    return resultado;
}

/**
 * constante 
 */
const calTabla2=function(pnumero){
    let numero = pnumero;
    let contador = 0;
    let multiplicacion = 0;
    let resultado="";
    while (contador < 5) {
        contador = contador + 1;
        multiplicacion = numero * contador;
        resultado += numero + " x " + contador + " = " + multiplicacion+"\n";
    }
    return resultado;
}