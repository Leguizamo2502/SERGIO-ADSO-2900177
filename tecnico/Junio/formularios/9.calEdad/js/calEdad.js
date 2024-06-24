function operaciones (){
    let fechaNacimiento = parseInt(document.getElementById('txtNumeroUno').value);
    let fechaActual = parseInt(document.getElementById('txtNumeroDos').value);

    let edad = calEdad(fechaNacimiento, fechaActual);

    
    
    let redad = `Tienes ${edad} <br>`

    document.getElementById('operaciones').innerHTML = redad;

    return false;
}

function calEdad(pfecNac, pfecAct){
    let edad;
    let fecNac = pfecNac;
    let fecAct = pfecAct;
    edad = fecAct - fecNac;
    if (edad >=18){
        return edad +", Eres mayor de edad";
    }else{
        return edad +", No eres mayor de edad";
    }
}