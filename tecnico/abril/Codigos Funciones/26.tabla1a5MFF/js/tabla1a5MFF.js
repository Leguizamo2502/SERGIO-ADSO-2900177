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
    while(tabla<=numero){
        tabla=tabla+1;
        multiplicar=0;
        while(multiplicar<=numero){
            resultado=tabla*(multiplicar+1);
            console.log(tabla+" x "+(multiplicar+1)+" = "+resultado);
            if(resultado%2==0){
                par++;
                console.log("Buzz")
            }else{
                impar++;
                console.log("Bass")
            }
            multiplicar++;
        }

    }
    console.log(impar);
    console.log(par);

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
    while(tabla<=numero){
        tabla=tabla+1;
        multiplicar=0;
        while(multiplicar<=numero){
            resultado=tabla*(multiplicar+1);
            console.log(tabla+" x "+(multiplicar+1)+" = "+resultado);
            if(resultado%2==0){
                par++;
                console.log("Buzz")
            }else{
                impar++;
                console.log("Bass")
            }
            multiplicar++;
        }

    }
    console.log(impar);
    console.log(par);

}