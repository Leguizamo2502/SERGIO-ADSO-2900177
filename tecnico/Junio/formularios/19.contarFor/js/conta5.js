function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);

    let cuenta = `Contar hasta ${num1} <br> ${contar5(num1)}`; 
    
    document.getElementById('operaciones').innerHTML = cuenta;

    return false;
}

  

function contar5(pnumero){
    let numero = pnumero;
    let contar;
    let resultado = "";
    for(contar=1;contar<=numero;contar++){
        resultado += contar+`<br>`;
    }
    return resultado;
}