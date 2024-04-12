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

    while (contador < numero) {
        contador = contador + 1;
        multiplicacion = numero * contador;
        console.log(numero + " x " + contador + " = " + multiplicacion);
    }
}

/**
 * constante 
 */
const calTabla2=function(pnumero){
    let numero = pnumero;
    let contador = 0;
    let multiplicacion = 0;

    while (contador < numero) {
        contador = contador + 1;
        multiplicacion = numero * contador;
        console.log(numero + " x " + contador + " = " + multiplicacion);
    }
}