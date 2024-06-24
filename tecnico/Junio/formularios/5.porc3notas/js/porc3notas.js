function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    let num2 = parseInt(document.getElementById('txtNumeroDos').value);
    let num3 = parseInt(document.getElementById('txtNumeroTres').value);

    let porc1 = porNota(num1,0.3);
    let porc2 = porNota(num2,0.3);
    let porc3 = porNota(num3,0.4);

    let sumaprom = suma(porc1,porc2,porc3);
    rporc1 = `Nota Uno ${porc1} <br>`;
    rporc2 = `Nota Dos ${porc2} <br>`;
    rporc3 = `Nota Tres ${porc3} <br>`;


    rsumaprom = `Nota Total: ${sumaprom} <br>`;
    

    document.getElementById('operaciones').innerHTML = rporc1 + rporc2 + rporc3 + rsumaprom;

    return false;
}

function porNota(pnota,pporc){
    let nota = pnota;
    let  porc = pporc;
    let rnota;
    rnota = nota * porc;
    return rnota;
}

function suma(pnota1,pnota2,pnota3){
    let nota1 = pnota1;
    let nota2 = pnota2;
    let nota3 = pnota3;
    let sumar;
    sumar = nota1 + nota2 + nota3;
    return sumar;
}
  