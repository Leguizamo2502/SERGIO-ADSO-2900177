/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calTabla(pnumero){
    let numero = pnumero;
    let multiplicacion  = 0;
    for(contar=1;contar<=numero;contar++){
        multiplicacion = numero * contar;
        console.log(numero+" x "+contar+" = "+multiplicacion);
    }

}
/**
 * constante 
 */
const calTabla2=function(pnumero){
    let numero = pnumero;
    let multiplicacion  = 0;
    for(contar=1;contar<=numero;contar++){
        multiplicacion = numero * contar;
        console.log(numero+" x "+contar+" = "+multiplicacion);
    }

}