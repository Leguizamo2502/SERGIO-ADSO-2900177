function calpromedio(){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    let num2 = parseInt(document.getElementById('txtNumeroDos').value);
    let num3 = parseInt(document.getElementById('txtNumeroTres').value);

    let promedioNota = promedio(num1, num2, num3);

    let rpromedio = `Promedio: ${promedioNota} <br>`;
    
    document.getElementById('promedio').innerHTML = rpromedio;
    return false;
}
function promedio(pnota1,pnota2,pnota3){
    let nota1 = pnota1;
    let nota2 = pnota2;
    let nota3 = pnota3;
    let prom = (nota1+nota2+nota3)/3;
    return prom;
}