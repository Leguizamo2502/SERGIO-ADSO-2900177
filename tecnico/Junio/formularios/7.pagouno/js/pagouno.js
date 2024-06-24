function operaciones (){
    let pagoDia = parseInt(document.getElementById('txtNumeroUno').value);
    let diasTrabajados = parseInt(document.getElementById('txtNumeroDos').value);

    let salario1 = calcularSalario(pagoDia, diasTrabajados);
    let salud1 = calcularSalud(pagoDia, diasTrabajados);
    let pension1 = calcularPension(pagoDia, diasTrabajados);
    let arl1 = calcularArl(pagoDia, diasTrabajados);
    let descuento1 = calcularDescuento(pagoDia, diasTrabajados);
    let pagoTotal1 = calcularPago(pagoDia, diasTrabajados);




    rsalario = `Salario bruto: ${salario1} <br>`;
    rsalud = `Salud: ${salud1} <br>`;
    rpension = `Pension: ${pension1} <br>`;
    rarl = `Arl: ${arl1} <br>`;
    rdescuento = `Descuento: ${descuento1} <br>`;
    rpagoTotal = `Pago total: ${pagoTotal1} <br>`;
    

    document.getElementById('operaciones').innerHTML = rsalario + rsalud + rpension + rarl + rdescuento + rpagoTotal;

    return false;
}

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