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

    while (contador < 5) {
        contador = contador + 1;
        multiplicacion = numero * contador;
        if(multiplicacion%2==0){
            console.log(multiplicacion+" es par")
        }else{
            console.log(multiplicacion+" es impar")
        }
    }
}
/**
 * constante 
 */
const calTabla2=function(pnumero){
    let numero = pnumero;
    let contador = 0;
    let multiplicacion = 0;

    while (contador < 5) {
        contador = contador + 1;
        multiplicacion = numero * contador;
        if(multiplicacion%2==0){
            console.log(multiplicacion+" es par")
        }else{
            console.log(multiplicacion+" es impar")
        }
    }
}       
