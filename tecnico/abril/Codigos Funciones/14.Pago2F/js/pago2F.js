/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function CalSalario(pvDia,pdTra){
    let salario;
    let vDia = pvDia;
    let dTra = pdTra;
    salario=vDia*dTra;
    return salario;

}

function calSalud(psalario){
    let salario= psalario;
    let salud = salario*0.12;
    return salud;

}

function calPension(psalario){
    let salario= psalario;
    let pension = salario*0.16;
    return pension;

}

function calArl(psalario){
    let salario= psalario;
    let arl = salario*0.052;
    return arl;
}

function calDescuento(psalud,ppension,parl){
    let salud= psalud;
    let pension= ppension;
    let arl= parl;
    let descuento;
    descuento = salud+pension+arl;
    return descuento;
}

function calSubTransporte(psalario){
    let salario= psalario;
    let subTransporte = 0;
    if(salario<(2*1300000)){
        subTransporte = subTransporte+114000;
    }else{
        subTransporte = subTransporte+0;
    }
    return subTransporte;
}
function calRetencion(psalario){
    let salario= psalario;
    let retencion= 0;
    if(salario>(4*1300000)){
        retencion=salario*0.04;
    }else{
        retencion=retencion+0;
    }
    return retencion;

}

function calPagoTotal(psalario,psubTransporte,pdescuento,pretencion){
    let salario= psalario;
    let subTransporte= psubTransporte;
    let descuento= pdescuento;
    let retencion= pretencion;
    let pagoTotal;
    pagoTotal = (salario+subTransporte)-(descuento+retencion);
    return pagoTotal;
}
/**
 * constante 
 */


const CalSalario2=function(pvDia,pdTra){
    let salario;
    let vDia = pvDia;
    let dTra = pdTra;
    salario=vDia*dTra;
    return salario;

}

const calSalud2=function(psalario){
    let salario= psalario;
    let salud = salario*0.12;
    return salud;

}

const calPension2=function(psalario){
    let salario= psalario;
    let pension = salario*0.16;
    return pension;

}

const calArl2=function(psalario){
    let salario= psalario;
    let arl = salario*0.052;
    return arl;
}

const calDescuento2=function(psalud,ppension,parl){
    let salud= psalud;
    let pension= ppension;
    let arl= parl;
    let descuento;
    descuento = salud+pension+arl;
    return descuento;
}

const calSubTransporte2=function(psalario){
    let salario= psalario;
    let subTransporte = 0;
    if(salario<(2*1300000)){
        subTransporte = subTransporte+114000;
    }else{
        subTransporte = subTransporte+0;
    }
    return subTransporte;
}
const calRetencion2=function(psalario){
    let salario= psalario;
    let retencion= 0;
    if(salario>(4*1300000)){
        retencion=salario*0.04;
    }else{
        retencion=retencion+0;
    }
    return retencion;

}

const calPagoTotal2=function(psalario,psubTransporte,pdescuento,pretencion){
    let salario= psalario;
    let subTransporte= psubTransporte;
    let descuento= pdescuento;
    let retencion= pretencion;
    let pagoTotal;
    pagoTotal = (salario+subTransporte)-(descuento+retencion);
    return pagoTotal;
}