function operaciones (){
    let nota1 = parseInt(document.getElementById('txtNumeroUno').value);
    let nota2 = parseInt(document.getElementById('txtNumeroDos').value);
    let nota3 = parseInt(document.getElementById('txtNumeroTres').value);

    let porc1 = calNota(nota1, 0.2);
    let porc2 = calNota(nota2, 0.35);
    let porc3 = calNota(nota3, 0.45);

    let sumaporc = calSumaPorcentaje(porc1,porc2,porc3);
    let tipoNota = calTipo(sumaporc);

    let rsumaporc = `Tu nota es ${sumaporc}, `;

    document.getElementById('operaciones').innerHTML = rsumaporc + tipoNota; 

    return false;
}

function  calNota(pnota,pporcentaje){
    let nota=pnota;
    let porcentaje=pporcentaje;
    let porcNota=nota*porcentaje;
    return porcNota;
}

function calSumaPorcentaje(pnota1,pnota2,pnota3){
    let nota1=pnota1;
    let nota2=pnota2;
    let nota3=pnota3;
    let suma=nota1+nota2+nota3;
    return suma;
}

function calTipo(psumaporc){
    let sumaporc = psumaporc;
    if(sumaporc>=4.5){
        return " Nota Superior";
    }else if(sumaporc<4.5 && sumaporc >=3.5){
        return " Nota buena";
    }else if(sumaporc<3.5 && sumaporc>=3){
        return " Nota media";
    }else{
        return " Nota baja";
    }
    
}