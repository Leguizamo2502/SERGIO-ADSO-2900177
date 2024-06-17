function saludar (){
    let saludo = document.getElementById('txtSaludo').value;

    document.getElementById('saludo').innerHTML = `<strong>${saludo}</strong>`;
    
    return false;
}

  