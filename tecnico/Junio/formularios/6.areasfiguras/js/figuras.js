function operaciones (){
    let ladoC = parseInt(document.getElementById('txtNumeroUno').value);
    let baseR = parseInt(document.getElementById('txtNumeroDos').value);
    let alturaR = parseInt(document.getElementById('txtNumeroTres').value);
    let baseT = parseInt(document.getElementById('txtNumeroCuatro').value);
    let alturaT = parseInt(document.getElementById('txtNumeroCinco').value);
    
    let areaC = cuadrado(ladoC);
    let areaR = rectangulo(baseR,alturaR);
    let areaT = triangulo(baseT,alturaT);

    rareaC = `Area Cuadrado: ${areaC} <br>`;
    rareaR = `Area Rectangulo: ${areaR} <br>`;
    rareaT = `Area Triangulo: ${areaT} <br>`;
    

    document.getElementById('operaciones').innerHTML = rareaC + rareaR + rareaT;

    return false;
}

function cuadrado(plado){
    let area
    let lado = plado;
    area=lado*lado;
    return area;
}

function rectangulo(pbase,paltura){
    let area;
    let base = pbase;
    let altura = paltura;
    area = base * altura;
    return area;
    
}
function triangulo(pbase,paltura){
    let area;
    let base = pbase;
    let altura = paltura
    area = (base * altura) / 2;
    return area;

}