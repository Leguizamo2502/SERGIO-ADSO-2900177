function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    let num2 = parseInt(document.getElementById('txtNumeroDos').value);
    let numMayor = numeroMayor(num1, num2);

    rnumMayor = `El numero mayor entre ${num1} y ${num2} es: ${numMayor} <br>`

    document.getElementById('operaciones').innerHTML = rnumMayor;

    return false;
}

function numeroMayor(pnum1,pnum2){
    let mayor;
    let num1 = pnum1;
    let num2 = pnum2;
    if (num1 > num2){
        mayor = num1;
    }
    else{
        mayor = num2;
    }
    return mayor;
}