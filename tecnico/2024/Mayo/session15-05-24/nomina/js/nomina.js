/**
 * Sergio Leguizamo
 * Nomina
 * 15-05-24
 */



//FUNCIONES 

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
function calAbonos(pvDia,pdTra,pestrato){
    let abonos=0;
    let estrato = pestrato;
    if((calSalario(pvDia,pdTra)<=1300000) && (estrato == 1 || estrato==2)){
        abonos = 100000;
    }else{
        abonos = 0;
    }
    return abonos;
}

function calRetencion(pvDia,pdTra,pestrato){
    let retencion= 0;
    let estrato = pestrato;
    if(calSalario(pvDia,pdTra)>(4*1300000) && calSalario(pvDia,pdTra)<(6*1300000)){
        retencion=calSalario(pvDia,pdTra)*0.03;
    }else if(calSalario(pvDia,pdTra)>(6*1300000) && calSalario(pvDia,pdTra)<(8*1300000)){
        retencion=calSalario(pvDia,pdTra)*0.04;
    }else if((calSalario(pvDia,pdTra)>(8*1300000)) && (estrato == 6)){
        retencion=calSalario(pvDia,pdTra)*0.06;
    }else{
        retencion=0;
    }
    return retencion;
} 

function calPagoTotal(pvDia,pdTra,pestrato){
    let salario= calSalario(pvDia,pdTra);
    let subTransporte= calSubTransporte(pvDia,pdTra);
    let descuento= calDescuento(pvDia,pdTra);
    let retencion= calRetencion(pvDia,pdTra,pestrato);
    let abonos = calAbonos(pvDia,pdTra,pestrato);
    let pagoTotal;
    pagoTotal = (salario+subTransporte+abonos)-(descuento+retencion);
    return pagoTotal;
}

//Codigo
let nomina = [];
let iteracion;
let pagoNomina=[];
let salario1;
let salud1;
let pension1;
let arl1;
let subTransporte1;
let retencion1;
let abonos1;
let descuento1;
let pagoTotal1;

nomina=[
    {cedula:1083234097, nombre:'Andres', apellido:'Moreno', edad:44,estrato:2, valorDia:10000,diasTrabajados:30},
    {cedula:1083236297, nombre:'Mauricio', apellido:'Noscue', edad:18,estrato:2,valorDia:90000,diasTrabajados:30},
    {cedula:1109234097, nombre:'Jorge', apellido:'Baron', edad:20,estrato:1,valorDia:160000,diasTrabajados:30},
    {cedula:1083233593, nombre:'Brayan', apellido:'Casas', edad:25,estrato:3,valorDia:150000,diasTrabajados:30},
    {cedula:1083200997, nombre:'Gerardo', apellido:'Cerquera', edad:35,estrato:4,valorDia:110000,diasTrabajados:30},
    {cedula:1087239997, nombre:'Samuel', apellido:'Cortez', edad:27,estrato:2,valorDia:220000,diasTrabajados:30},
    {cedula:1012234097, nombre:'Stiven', apellido:'blessd', edad:28,estrato:2,valorDia:140000,diasTrabajados:30},
    {cedula:1084684097, nombre:'Antonio', apellido:'Chala', edad:24,estrato:3,valorDia:130000,diasTrabajados:30},
    {cedula:1083898327, nombre:'Cristiano', apellido:'Ronaldo', edad:38,estrato:6,valorDia:300000,diasTrabajados:30},
    {cedula:1083230931, nombre:'Andres', apellido:'Messi', edad:36,estrato:6,valorDia:500000,diasTrabajados:30}
];


for(iteracion=0;iteracion<nomina.length;iteracion++){
    salario1 = calSalario(nomina[iteracion].diasTrabajados, nomina[iteracion].valorDia);
    salud1 = calSalud(nomina[iteracion].diasTrabajados, nomina[iteracion].valorDia);
    pension1 = calPension(nomina[iteracion].diasTrabajados, nomina[iteracion].valorDia);
    arl1 = calArl(nomina[iteracion].diasTrabajados, nomina[iteracion].valorDia);
    subTransporte1 = calSubTransporte(nomina[iteracion].diasTrabajados, nomina[iteracion].valorDia);
    retencion1 = calRetencion(nomina[iteracion].diasTrabajados, nomina[iteracion].valorDia, nomina[iteracion].estrato)
    abonos1 = calAbonos(nomina[iteracion].diasTrabajados, nomina[iteracion].valorDia,nomina[iteracion].estrato);
    descuento1= calDescuento(nomina[iteracion].diasTrabajados, nomina[iteracion].valorDia)
    pagoTotal1 = calPagoTotal(nomina[iteracion].diasTrabajados, nomina[iteracion].valorDia, nomina[iteracion].estrato)

    pagoNomina.push({cedula:nomina[iteracion].cedula,
        nombre:nomina[iteracion].nombre,
        apellido:nomina[iteracion].apellido,
        edad:nomina[iteracion].edad,
        estrato:nomina[iteracion].estrato,
        valorDia:nomina[iteracion].valorDia,
        diasTrabajados:nomina[iteracion].diasTrabajados,
        salario:salario1,
        salud:salud1,
        pension:pension1,
        arl:arl1,
        subTransporte:subTransporte1,
        retencion:retencion1,
        abonos:abonos1,
        descuento:descuento1,
        pagoTotal:pagoTotal1

    })
}
console.log(pagoNomina);
