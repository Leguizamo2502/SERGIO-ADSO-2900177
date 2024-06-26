function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    
    let rnumero = `${calNum(num1)}`;


    document.getElementById('operaciones').innerHTML = rnumero;

    return false;
}

function calNum(pnumero){
    let numero = pnumero;
    let contador = 0;
    let resultadoC = ""
    while(contador<numero){
        contador++;
        resultadoC += contador+`<br>`;
    }
    return resultadoC;
}