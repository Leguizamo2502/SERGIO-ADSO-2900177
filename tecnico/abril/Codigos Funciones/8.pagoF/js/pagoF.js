/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calcularSalario(pavalorDia, pdiasTrab) {
    let valorDia = pavalorDia;
    let diasTra = pdiasTrab;
    let salario = diasTra * valorDia;
    return   salario;
}


function calcularSalud(psalario, pporcentaje1) {
    let salarioo = psalario;
    let porcentaje = pporcentaje1;
    let salud = salarioo * porcentaje;
    return salud;
}

function calcularPension(psalario, pporcentaje2) {
    let salarioo = psalario;
    let porcentaje = pporcentaje2;
    let pension = salarioo * porcentaje;
    return pension;
}

function calcularArl(psalario, pporcentaje3) {
    let salarioo = psalario;
    let porcentaje = pporcentaje3;
    let arl = salarioo * porcentaje;
    return arl;
}


function calcularDescuento(psalud, ppension,parl){
    let salud = psalud;
    let pension = ppension;
    let arl = parl;
    let descuento;
    descuento = salud + pension + arl;
    return descuento;
}

function calcularPago(psalario,pdescuento){
    let salario  = psalario;
    let descuento = pdescuento;
    let pago;
    pago = salario - descuento;
    return pago;
   
}


/**
 * constante 
 */

const calcularSalario2 = function(pavalorDia, pdiasTrab) {
    let valorDia = pavalorDia;
    let diasTra = pdiasTrab;
    let salario = diasTra * valorDia;
    return   salario;
}

const calcularSalud2 = function(psalario, pporcentaje1) {
    let salarioo = psalario;
    let porcentaje = pporcentaje1;
    let salud = salarioo * porcentaje;
    return salud;
}
const calcularPension2 = function(psalario, pporcentaje2) {
    let salarioo = psalario;
    let porcentaje = pporcentaje2;
    let pension = salarioo * porcentaje;
    return pension;
}
const calcularArl2 = function(psalario, pporcentaje3) {
    let salarioo = psalario;
    let porcentaje = pporcentaje3;
    let arl = salarioo * porcentaje;
    return arl;
}

const calcularDescuento2 = function(psalud, ppension,parl){
    let salud = psalud;
    let pension = ppension;
    let arl = parl;
    let descuento;
    descuento = salud + pension + arl;
    return descuento;
}
const calcularPago2 = function(psalario,pdescuento){
    let salario  = psalario;
    let descuento = pdescuento;
    let pago;
    pago = salario - descuento;
    return pago;
                                
}