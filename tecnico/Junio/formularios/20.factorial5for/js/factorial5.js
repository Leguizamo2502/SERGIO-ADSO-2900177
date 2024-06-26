function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    
    let facto = `El factorial de ${num1} es ${factorial(num1)}`;

    document.getElementById('operaciones').innerHTML = facto;

    return false;
}

  

function factorial(pnumero){
    let numero = pnumero;
    let factorial = 1
    for(contar=1; contar<=numero; contar++){
    factorial = factorial*contar
}
    return factorial;
}