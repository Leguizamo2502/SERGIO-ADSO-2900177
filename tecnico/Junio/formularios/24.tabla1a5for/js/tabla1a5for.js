function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    
    let tabla = `Tabla del ${num1} <br> ${calTabla(num1)}`

    document.getElementById('operaciones').innerHTML = tabla;

    return false;
}
function calTabla(ptabla){
    let tabla = ptabla;
    let multiplicar = 5;
    let par=0;
    let impar=0;
    let resultadoTotal = ""
    for(let cTabla=1;cTabla<=tabla;cTabla++){
        for(let cMult=1;cMult<=multiplicar;cMult++){
            resultado=cTabla*cMult;
            resultadoTotal+=cTabla+" x "+cMult+" = "+resultado+`<br>`;
            
            if(resultado%2==0){
                par=par+1;
                resultadoTotal=resultadoTotal+"Buzz"+`<br>`;
            }else{
                impar=impar+1;
                resultadoTotal=resultadoTotal+"Bass"+`<br>`;
            }
            
        }
       }
        
       return resultadoTotal+"hay "+par+" pares"+`<br>`+"hay "+impar+" impares"+`<br>`;

}