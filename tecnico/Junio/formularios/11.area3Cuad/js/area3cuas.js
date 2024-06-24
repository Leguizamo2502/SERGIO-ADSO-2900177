function operaciones (){
    let ladoC1 = parseInt(document.getElementById('txtNumeroUno').value);
    let ladoC2 = parseInt(document.getElementById('txtNumeroDos').value);
    let ladoC3 = parseInt(document.getElementById('txtNumeroTres').value);

    let areaC1 = cuadrado(ladoC1);
    let areaC2 = cuadrado(ladoC2);
    let areaC3 = cuadrado(ladoC3);

    let areaMayor = cuadMayor(areaC1, areaC2, areaC3);
    
    let rareaMayor = `${areaMayor} <br>`

    document.getElementById('operaciones').innerHTML = rareaMayor;

    return false;
}

function cuadrado(plado){
    let areaCuadrado
    let lado = plado;
    areaCuadrado=lado*lado;
    return areaCuadrado;
}

function cuadMayor(parea1,parea2,parea3){
    let area1 = parea1;
    let area2 = parea2;
    let area3 = parea3;
    let mayor = `El area del cuadrado uno es mayor: ${area1}`;
    
    if(area1==area2 && area2==area3){
        mayor = "Las areas son iguales";}
    else if (area2 > mayor) {
        mayor = "El area del cuadrado dos es mayor: " + area2;
    }else if (area3 > mayor) {
        mayor = "El area del cuadrado tres es mayor: " + area3 ;
    }
    return mayor;

}