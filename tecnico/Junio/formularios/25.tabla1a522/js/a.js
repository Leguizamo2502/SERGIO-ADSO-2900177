function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    
    let tabla = `Tabla del ${num1} <br> ${calTabla(num1)}`

    document.getElementById('operaciones').innerHTML = tabla;

    return false;
}

function calTabla(pnumero) {
    let numero = pnumero;
    let multiplicar;
    let resultado=0;
    let tabla=0;
    let par=0;
    let impar=0;
    let resultadoTotal = "";
    while(tabla<=numero){
        tabla=tabla+1;
        multiplicar=0;
        while(multiplicar<=numero){
            resultado=tabla*(multiplicar+1);
            resultadoTotal += tabla+" x "+(multiplicar+1)+" = "+resultado+`<br>`;

            if(resultado%2==0){
                par++;
                resultadoTotal=resultadoTotal+" Buzz"+`<br>`;
            }else{
                impar++;
                resultadoTotal=resultadoTotal+" Bass"+`<br>`;
            }
            multiplicar++;
        }

    }
    
    return resultadoTotal+"hay "+par+" pares"+`<br>`+"hay "+impar+" impares"+`<br>`;
}