function operaciones (){
    let num1 = parseInt(document.getElementById('txtNumeroUno').value);
    let num2 = parseInt(document.getElementById('txtNumeroDos').value);
    let num3 = parseInt(document.getElementById('txtNumeroTres').value);
    
    let numMayor = mayorNum(num1, num2, num3);

    let rnumMayor = `${numMayor} <br>`;

    document.getElementById('operaciones').innerHTML = rnumMayor;

    return false;
}

function mayorNum(pnum1, pnum2,pnum3) {
    let num1 = pnum1;
    let num2 = pnum2;
    let num3 = pnum3;

    if (num1 === num2 && num2 === num3) {
        return "Todos los números son iguales.";
    } else if (num1 >= num2 && num1 >= num3) {
        return `El mayor número es ${num1}.`;
    } else if (num2 >= num1 && num2 >= num3) {
        return `El mayor número es ${num2}.`;
    } else {
        return `El mayor número es ${num3}.`;
    }
}