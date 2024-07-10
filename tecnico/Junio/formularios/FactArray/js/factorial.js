/**
 * Sergio Leguizamo
 */

let arreglo = [];
let iteracion;
let factorial;
let numero2;
let resultaLista = "";

numero2 = 5;
factorial = 1;

for(iteracion = 1; iteracion <= numero2; iteracion++){
    factorial = factorial * iteracion;
    arreglo.push({ numero: iteracion, factorial: factorial });
}

for (iteracion = 0; iteracion < arreglo.length; iteracion++) {
    resultaLista += `<tr><td>${arreglo[iteracion].numero}</td><td>${arreglo[iteracion].factorial}</td></tr>`; 
}

document.getElementById('lista').innerHTML = resultaLista;