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
    
    if (area1 === area2 && area2 === area3) {
        return "Todos los números son iguales.";
    } else if (area1 >= area2 && area1 >= area3) {
        return `El area mayor es del cuadrado uno ${area1}.`;
    } else if (area2 >= area1 && area2 >= area3) {
        return `El area mayor es del cuadrado dos ${area2}.`;
    } else {
        return `El area mayor es del cuadrado tres ${area3}.`;
    }
}