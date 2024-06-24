function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    let num2 = parseInt(document.getElementById('txtNumeroDos').value);
    let sumar= num1+num2;
    let restar= num1-num2;  
    let multiplicar= num1*num2;
    let dividir= num1/num2;

    sumar= num1+num2;
    restar= num1-num2;  
    multiplicar= num1*num2;
    dividir= num1/num2;

    let rsuma = `Suma: ${sumar} <br>`;
    let rresta = `Resta: ${restar} <br>`;
    let rmultiplicar = `Multiplicación: ${multiplicar} <br>`;
    let rdividir = `División: ${dividir} <br>`

    document.getElementById('operaciones').innerHTML = rsuma + rresta + rmultiplicar + rdividir;

    return false;
}

  