/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
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
            resultadoTotal += tabla+" x "+(multiplicar+1)+" = "+resultado+"\n";

            if(resultado%2==0){
                par++;
                resultadoTotal=resultadoTotal+" Buzz"+"\n";
            }else{
                impar++;
                resultadoTotal=resultadoTotal+" Bass"+"\n";
            }
            multiplicar++;
        }

    }
    
    return resultadoTotal+"hay "+par+" pares"+"\n"+"hay "+impar+" impares"+"\n";
}
/**
 * constante 
 */
const calTabla2=function(pnumero) {
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
            resultadoTotal += tabla+" x "+(multiplicar+1)+" = "+resultado+"\n";

            if(resultado%2==0){
                par++;
                resultadoTotal=resultadoTotal+" Buzz"+"\n";
            }else{
                impar++;
                resultadoTotal=resultadoTotal+" Bass"+"\n";
            }
            multiplicar++;
        }

    }
    
    return resultadoTotal+"hay "+par+" pares"+"\n"+"hay "+impar+" impares"+"\n";

}