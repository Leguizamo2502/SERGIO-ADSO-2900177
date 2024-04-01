/**
 * Operaciones aritmeticas aplicand funciones como una expresion
 * Autor: Sergio Andres Leguizamo
 * Fecha: Lunes 01 de abril de 2024
 * 
 */

let num1;
let num2;

const suma = function(pnum1, pnum2) {
    let sumar;
    num1 = pnum1;
    num2 = pnum2;
    sumar = num1 + num2;
    return sumar;

}

const resta = function(pnum1, pnum2) {
    let restar;
    num1 = pnum1;
    num2 = pnum2;
    restar = num1 - num2;
    return restar;

}
const multiplicacion = function(pnum1, pnum2) {
    let multiplicar;
    num1 = pnum1;
    num2 = pnum2;
    multiplicar = num1 * num2;
    return multiplicar;

}
const division = function(pnum1, pnum2) {
    let dividir;
    num1 = pnum1;
    num2 = pnum2;
    dividir = num1 / num2;
    return dividir;

}

const operaciones = function(poperador, pnum1, pnum2){
    let operador = poperador;
    num1= pnum1;
    num2 = pnum2;
    if  (operador=="suma"){
        return suma(num1,num2);
    }
    else if (operador == "resta"){
        return resta(num1,num2);
    }
    else if (operador == "multiplicacion"){
        return multiplicacion(num1,num2);
    }else if (operador == "division"){
        return  division(num1,num2);
    }
    else {
        return "Error!!! no reconoce operador"
    }
}