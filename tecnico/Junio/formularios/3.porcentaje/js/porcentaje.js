function Calporc(){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    let porcentajenum = porcentaje(num1);

    rporc = `Porcentaje: ${porcentajenum} <br>`;
    document.getElementById('porcentaje').innerHTML = rporc;
    return false;
}
function porcentaje(pnum1){
    let porc;
    let num1 = pnum1
    porc = num1/100;
    return porc;
}