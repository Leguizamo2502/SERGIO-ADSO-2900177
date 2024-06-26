function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
  
    
    let tabla =`La tabla del ${num1} hasta 5<br> ${calTabla(num1)}  <br>`;

    

    document.getElementById('operaciones').innerHTML = tabla;
    ;

    return false;
}

  

function calTabla(pnumero){
    let numero = pnumero;
    let contador = 0;
    let multiplicacion = 0;
    let resultado = "";

    while (contador < 5) {
        contador = contador + 1;
        multiplicacion = numero * contador;
        if(multiplicacion%2==0){
            resultado+=multiplicacion+" es par"+`<br>`;
        }else{
            resultado+=multiplicacion+" es impar"+`<br>`;
        }
    }
    return resultado;
}