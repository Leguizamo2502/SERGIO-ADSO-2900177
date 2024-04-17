/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: jueves 04 de abril de 2024
 * 
 */
function cuadrado1(plado){
    let areaCuadrado
    let lado = plado;
    areaCuadrado=lado*lado;
    return areaCuadrado;
}

function cuadMayor(parea1,parea2,parea3){
    let area1 = parea1;
    let area2 = parea2;
    let area3 = parea3;
    let mayor = area1;
    
    if(area1==area2 && area1==area3 && area2==area3){
    mayor = "Las areas son iguales";}
    else if (area2 > mayor) {
        mayor = area2;
    }else if (area3 > mayor) {
        mayor = area3;
    }
    return mayor;

}
/**
 * constante 
 */

const cuadrado2=function(plado){
    let areaCuadrado
    let lado = plado;
    areaCuadrado=lado*lado;
    return areaCuadrado;
}

const cuadMayor2=function(parea1,parea2,parea3){
    let area1 = parea1;
    let area2 = parea2;
    let area3 = parea3;
    let mayor = area1;
    
    if(area1==area2 && area1==area3 && area2==area3){
        mayor = "Las areas son iguales";}
        else if (area2 > mayor) {
        mayor = area2;
    }else if (area3 > mayor) {
        mayor = area3;
    }
    return mayor;

}