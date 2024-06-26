function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    
let tabla = `Tabla del ${num1} <br> ${calTabla(num1)}`;

    document.getElementById('operaciones').innerHTML = tabla;

    return false;
}

  
function calTabla(pnumero){
    let numero = pnumero;
    let multiplicacion = 1;
    let resultado = "";
    for(contar=1;contar<=5;contar++){
        multiplicacion = numero * contar;
        if (multiplicacion%2 == 0){
            resultado+=multiplicacion+" es par"+`<br>`;
        }else{
            resultado+=multiplicacion+" es impar"+`<br>`;
        }
    }
    return resultado;
}