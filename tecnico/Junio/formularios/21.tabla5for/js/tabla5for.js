function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
   
    let tabla = `Tabla del ${num1} hasta 5<br> ${calTabla(num1)}`;
   

    document.getElementById('operaciones').innerHTML = tabla;

    return false;
}

function calTabla(pnumero){
    let numero = pnumero;
    let multiplicacion  = 0;
    let resultado = "";
    for(contar=1;contar<=5;contar++){
        multiplicacion = numero * contar;
        resultado+=numero+" x "+contar+" = "+multiplicacion+`<br>`;
    }
    return resultado;
}