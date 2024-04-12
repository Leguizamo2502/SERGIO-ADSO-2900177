/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calTabla(ptabla,pmultiplicar){
    let tabla = ptabla;
    let multiplicar = pmultiplicar;
    let par=0;
    let impar=0;
    for(cTabla=1;cTabla<=tabla;cTabla++){
        for(cMult=1;cMult<=multiplicar;cMult++){
            resultado=cTabla*cMult;
            
            if(resultado%2==0){
                par=par+1;
               console.log("Buzz");
            }else{
                impar=impar+1;
                console.log("Bass")
            }
            console.log(cTabla+" x "+cMult+" = "+resultado);
        }
       }
        console.log(par);
        console.log(impar);

}
/**
 * constante 
 */
const calTabla2=function(ptabla,pmultiplicar){
    let tabla = ptabla;
    let multiplicar = pmultiplicar;
    let par=0;
    let impar=0;
    for(cTabla=1;cTabla<=tabla;cTabla++){
        for(cMult=1;cMult<=multiplicar;cMult++){
            resultado=cTabla*cMult;
            
            if(resultado%2==0){
                par=par+1;
               console.log("Buzz");
            }else{
                impar=impar+1;
                console.log("Bass")
            }
            console.log(cTabla+" x "+cMult+" = "+resultado);
        }
       }
        console.log(par);
        console.log(impar);

}