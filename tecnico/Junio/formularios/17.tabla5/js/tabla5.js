function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    
    let rtabla = `Tabla del ${num1} hasta 5 <br> ${calTabla(num1)}`;

    

    document.getElementById('operaciones').innerHTML = rtabla;

    return false;
}

function calTabla(pnumero){
    let numero = pnumero;
    let contador = 0;
    let multiplicacion = 0;
    let resultado="";
    while (contador < 5) {
        contador = contador + 1;
        multiplicacion = numero * contador;
        resultado += numero + " x " + contador + " = " + multiplicacion+`<br>`;
    }
    return resultado;
}
