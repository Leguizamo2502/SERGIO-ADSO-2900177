function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    
    let tabla = `Tabla del ${num1} <br> ${calTabla(num1)}`

    document.getElementById('operaciones').innerHTML = tabla;

    return false;
}

  
function calTabla(phasta){
    let hasta = phasta;
    let contar1=0;
    let contar2;
    let par = 0;
    let impar = 0;
    let resultado="";
    while(contar1<hasta){
        contar2=0
        contar1=contar1+1;

        while(contar2<hasta){
            contar2=contar2+1;
            multiplicacion=contar1*contar2;
            resultado+= contar1+" x "+contar2+" = "+multiplicacion+`<br>`;
        
            if(multiplicacion%2 == 0){
                par=par+1;
                resultado=resultado+"Buzz"+`<br>`;
            }else{
                impar=impar+1
                resultado=resultado+"Bass"+`<br>`;
            }
        }
    }
    
    return resultado+"hay "+par+" pares"+`<br>`+"hay "+impar+" impares";
    

}