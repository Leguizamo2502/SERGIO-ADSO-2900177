function operaciones (){
    let pagoDia = parseInt(document.getElementById('txtNumeroUno').value);
    let diasTrabajados = parseInt(document.getElementById('txtNumeroDos').value);
    
    let salario = calSalario(pagoDia, diasTrabajados);
    let salud = calSalud(pagoDia, diasTrabajados);
    let pension = calPension(pagoDia, diasTrabajados);
    let arl = calArl(pagoDia, diasTrabajados);
    let descuento = calDescuento(pagoDia, diasTrabajados);
    let subTransporte = calSubTransporte(pagoDia, diasTrabajados);
    let retencion = calRetencion(pagoDia, diasTrabajados);
    let pagoTotal = calPagoTotal(pagoDia, diasTrabajados);

    let rsalario = `Salario: ${salario} <br>`;
    let rsalud = `Salud: ${salud} <br>`;
    let rpension = `Pension: ${pension} <br>`;
    let rarl = `Arl: ${arl} <br>`;
    let rdescuento = `Descuento: ${descuento} <br>`;
    let rsubTransporte = `SubTransporte: ${subTransporte} <br>`;
    let rretencion = `Retencion: ${retencion} <br>`;
    let rpagoTotal = `Pago total: ${pagoTotal} <br>`;



    document.getElementById('operaciones').innerHTML = rsalario + rsalud + rpension + rarl + rdescuento + rsubTransporte + rretencion + rpagoTotal

    return false;
}

function calSalario(pvDia,pdTra){
    let salario;
    let vDia = pvDia;
    let dTra = pdTra;
    salario=vDia*dTra;
    return salario;

}

function calSalud(pvDia,pdTra){
    let salud = calSalario(pvDia,pdTra)*0.12;
    return salud;

}

function calPension(pvDia,pdTra){
    let pension = calSalario(pvDia,pdTra)*0.16;
    return pension;

}

function calArl(pvDia,pdTra){
    let arl = calSalario(pvDia,pdTra)*0.052;
    return arl;
}

function calDescuento(pvDia,pdTra){
    let salud= calSalud(pvDia,pdTra);
    let pension= calPension(pvDia,pdTra);
    let arl= calArl(pvDia,pdTra);
    let descuento;
    descuento = salud+pension+arl;
    return descuento;
}

function calSubTransporte(pvDia,pdTra){
    let subTransporte = 0;
    if(calSalario(pvDia,pdTra)<(2*1300000)){
        subTransporte = subTransporte+114000;
    }else{
        subTransporte = subTransporte+0;
    }
    return subTransporte;
}
function calRetencion(pvDia,pdTra){
    let retencion= 0;
    if(calSalario(pvDia,pdTra)>(4*1300000)){
        retencion=calSalario(pvDia,pdTra)*0.04;
    }else{
        retencion=retencion+0;
    }
    return retencion;

}

function calPagoTotal(pvDia,pdTra){
    let salario= calSalario(pvDia,pdTra);
    let subTransporte= calSubTransporte(pvDia,pdTra);
    let descuento= calDescuento(pvDia,pdTra);
    let retencion= calRetencion(pvDia,pdTra);
    let pagoTotal;
    pagoTotal = (salario+subTransporte)-(descuento+retencion);
    return pagoTotal;
}