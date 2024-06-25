function operaciones (){
    let fecNacimiento1 = parseInt(document.getElementById('txtNumeroUno').value);
    let fecNacimiento2 = parseInt(document.getElementById('txtNumeroDos').value);
    let fecNacimiento3 = parseInt(document.getElementById('txtNumeroTres').value);
    let añoActual = parseInt(document.getElementById('txtNumeroCuatro').value);
    
    let edad1 = calEdad(fecNacimiento1,añoActual);
    let edad2 = calEdad(fecNacimiento2,añoActual);
    let edad3 = calEdad(fecNacimiento3,añoActual);

    let promEdad = promedio(edad1,edad2,edad3);

    let redad1 = `Persona uno tiene ${edad1} años y `+ calMayor(edad1)+ `<br>`;
    let redad2 = `Persona dos tiene ${edad2} años y `+ calMayor(edad2)+ `<br>`;
    let redad3 = `Persona tres tiene ${edad3} años y `+ calMayor(edad3) +`<br>`;

    let rpromedio = `El promedio de las edades es de ${promEdad} años y `+ calMayor(promEdad);
    

    document.getElementById('operaciones').innerHTML = redad1 + redad2 + redad3 + rpromedio;

    return false;
}


function calEdad(pfecNac, pfecAct){
    let edad;
    let fecNac = pfecNac;
    let fecAct = pfecAct;
    edad = fecAct - fecNac;
    return edad;
}

function calMayor(pedad){
    let edad = pedad;
    if(edad>=18){
        return "Es mayor de edad";
    }else{
        return "No es mayor de edad";
    }
}

function promedio(pedad1,pedad2,pedad3){
    let edad1 = pedad1;
    let edad2 = pedad2;
    let edad3 =pedad3;
    let promedio = (edad1+edad2+edad3)/3;
    return promedio;
}