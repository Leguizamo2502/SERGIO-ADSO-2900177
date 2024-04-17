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


function calcularSalud(psalario) {
    let salario = psalario;
    let salud = salario * 0.12;
    return salud;
}

function calcularPension(psalario) {
    let salario = psalario;
    let pension = salario * 0.16;
    return pension;
}

function calcularArl(psalario) {
    let salario = psalario;
    let arl = salario * 0.052;
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

const calcularSalud2 = function(psalario) {
    let salario = psalario;
    let salud = salario * 0.12;
    return salud;
}
const calcularPension2 = function(psalario) {
    let salario = psalario;
    let pension = salario * 0.16;
    return pension;
}
const calcularArl2 = function(psalario) {
    let salario = psalario;
    let arl = salario * 0.052;
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