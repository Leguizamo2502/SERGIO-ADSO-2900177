/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function mayorNum(pnum1, pnum2,pnum3) {
    let num1 = pnum1;
    let num2 = pnum2;
    let num3 = pnum3;
    let mayor = num1;

    if (num1 == num2 && num1 == num3 && num2 == num3){
        mayor = "Los valores son iguales";
    }else if (num2 > mayor) {
        mayor = num2;
    }else if (num3 > mayor) {
        mayor = num3;
    }
    return mayor;
}

/**
 * constante 
 */

const mayorNum2 =function(pnum1, pnum2,pnum3) {
    let num1 = pnum1;
    let num2 = pnum2;
    let num3 = pnum3;
    let mayor = num1;

    if (num1 == num2 && num1 == num3 && num2 == num3){
        mayor = "Los valores son iguales";
    }else if (num2 > mayor) {
        mayor = num2;
    }else if (num3 > mayor) {
        mayor = num3;
    }
    return mayor;
}