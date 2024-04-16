/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function calTabla(pnumero){
    let numero = pnumero;
    let multiplicacion  = 0;
    let resultado = "";
    for(contar=1;contar<=numero;contar++){
        multiplicacion = numero * contar;
        resultado+=numero+" x "+contar+" = "+multiplicacion+"\n";
    }
    return resultado;
}
/**
 * constante 
 */
const calTabla2=function(pnumero){
    let numero = pnumero;
    let multiplicacion  = 0;
    let resultado = "";
    for(contar=1;contar<=numero;contar++){
        multiplicacion = numero * contar;
        resultado+=numero+" x "+contar+" = "+multiplicacion+"\n";
    }
    return resultado;

}