/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calTabla(ptabla){
    let tabla = ptabla;
    let multiplicar = 5;
    let par=0;
    let impar=0;
    let resultadoTotal = ""
    for(cTabla=1;cTabla<=tabla;cTabla++){
        for(cMult=1;cMult<=multiplicar;cMult++){
            resultado=cTabla*cMult;
            resultadoTotal+=cTabla+" x "+cMult+" = "+resultado+"\n";
            
            if(resultado%2==0){
                par=par+1;
                resultadoTotal=resultadoTotal+"Buzz"+"\n";
            }else{
                impar=impar+1;
                resultadoTotal=resultadoTotal+"Bass"+"\n";
            }
            
        }
       }
        
       return resultadoTotal+"hay "+par+" pares"+"\n"+"hay "+impar+" impares"+"\n";

}
/**
 * constante 
 */
const calTabla2=function(ptabla){
    let tabla = ptabla;
    let multiplicar = 5;
    let par=0;
    let impar=0;
    let resultadoTotal = ""
    for(cTabla=1;cTabla<=tabla;cTabla++){
        for(cMult=1;cMult<=multiplicar;cMult++){
            resultado=cTabla*cMult;
            resultadoTotal+=cTabla+" x "+cMult+" = "+resultado+"\n";
            
            if(resultado%2==0){
                par=par+1;
                resultadoTotal=resultadoTotal+"Buzz"+"\n";
            }else{
                impar=impar+1;
                resultadoTotal=resultadoTotal+"Bass"+"\n";
            }
            
        }
       }
        
       return resultadoTotal+"hay "+par+" pares"+"\n"+"hay "+impar+" impares"+"\n";
}