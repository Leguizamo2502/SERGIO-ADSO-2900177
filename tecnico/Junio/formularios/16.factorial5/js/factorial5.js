function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    
    let factorial = `EL factorial de ${num1} es ${calFactorial(num1)}`;
    

    document.getElementById('operaciones').innerHTML = factorial;

    return false;
}

function calFactorial(pnumero){
    let numero = pnumero;
    let contador = 0;
    let factorial = 1;
    while(contador<numero){
        contador= contador+1;
        factorial=factorial*contador;
    }
    return factorial;
    
}