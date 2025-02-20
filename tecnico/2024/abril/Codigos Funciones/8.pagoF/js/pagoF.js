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


function calcularSalud(pavalorDia, pdiasTrab) {
    let salud = calcularSalario(pavalorDia, pdiasTrab) * 0.12;
    return salud;
}

function calcularPension(pavalorDia, pdiasTrab) {
    let pension = calcularSalario(pavalorDia, pdiasTrab) * 0.16;
    return pension;
}

function calcularArl(pavalorDia, pdiasTrab) {
    let arl = calcularSalario(pavalorDia, pdiasTrab) * 0.052;
    return arl;
}


function calcularDescuento(pavalorDia, pdiasTrab){
    let salud = calcularSalud(pavalorDia, pdiasTrab);
    let pension = calcularPension(pavalorDia, pdiasTrab);
    let arl = calcularArl(pavalorDia, pdiasTrab);
    let descuento;
    descuento = salud + pension + arl;
    return descuento;
}

function calcularPago(pavalorDia, pdiasTrab){
    let salario  = calcularSalario(pavalorDia, pdiasTrab);
    let descuento = calcularDescuento(pavalorDia, pdiasTrab);
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
    return salario;
}

const calcularSalud2 = function(pavalorDia, pdiasTrab) {
    let salud = calcularSalario2(pavalorDia, pdiasTrab) * 0.12;
    return salud;
}
const calcularPension2 = function(pavalorDia, pdiasTrab) {
    let pension = calcularSalario2(pavalorDia, pdiasTrab) * 0.16;
    return pension;
}
const calcularArl2 = function(pavalorDia, pdiasTrab) {
    let arl = calcularSalario2(pavalorDia, pdiasTrab) * 0.052;
    return arl;
}

const calcularDescuento2 = function(pavalorDia, pdiasTrab){
    let salud = calcularSalud2(pavalorDia, pdiasTrab);
    let pension = calcularPension2(pavalorDia, pdiasTrab);
    let arl = calcularArl2(pavalorDia, pdiasTrab);
    let descuento;
    descuento = salud + pension + arl;
    return descuento;
}
const calcularPago2 = function(pavalorDia, pdiasTrab){
    let salario  = calcularSalario2(pavalorDia, pdiasTrab);
    let descuento = calcularDescuento2(pavalorDia, pdiasTrab);
    let pago;
    pago = salario - descuento;
    return pago;
                                
}