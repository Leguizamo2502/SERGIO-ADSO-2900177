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

function calSalud(psalario,pporcentaje1){
    let salario= psalario;
    let porcentaje1= pporcentaje1;
    let salud = salario*porcentaje1;
    return salud;

}

function calPension(psalario,pporcentaje2){
    let salario= psalario;
    let porcentaje2= pporcentaje2;
    let pension = salario*porcentaje2;
    return pension;

}

function calArl(psalario,pporcentaje3){
    let salario= psalario;
    let porcentaje3= pporcentaje3;
    let arl = salario*porcentaje3;
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

function calSubTransporte(psalario,psMinimo){
    let salario= psalario;
    let sMinimo= psMinimo;
    let subTransporte = 0;
    if(salario<(2*sMinimo)){
        subTransporte = subTransporte+114000;
    }else{
        subTransporte = subTransporte+0;
    }
    return subTransporte;
}
function calRetencion(psalario,psMinimo){
    let salario= psalario;
    let sMinimo= psMinimo;
    let retencion= 0;
    if(salario>(4*sMinimo)){
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

const calSalud2=function(psalario,pporcentaje1){
    let salario= psalario;
    let porcentaje1= pporcentaje1;
    let salud = salario*porcentaje1;
    return salud;

}

const calPension2=function(psalario,pporcentaje2){
    let salario= psalario;
    let porcentaje2= pporcentaje2;
    let pension = salario*porcentaje2;
    return pension;

}

const calArl2=function(psalario,pporcentaje3){
    let salario= psalario;
    let porcentaje3= pporcentaje3;
    let arl = salario*porcentaje3;
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

const calSubTransporte2=function(psalario,psMinimo){
    let salario= psalario;
    let sMinimo= psMinimo;
    let subTransporte = 0;
    if(salario<(2*sMinimo)){
        subTransporte = subTransporte+114000;
    }else{
        subTransporte = subTransporte+0;
    }
    return subTransporte;
}
const calRetencion2=function(psalario,psMinimo){
    let salario= psalario;
    let sMinimo= psMinimo;
    let retencion= 0;
    if(salario>(4*sMinimo)){
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