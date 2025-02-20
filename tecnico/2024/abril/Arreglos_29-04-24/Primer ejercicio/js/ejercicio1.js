/**
 * Arreglos
 * Sergio Leguizamo
 * 29-04-24
 */
let arregloNUmero = [];
let arregloFruta = [];
let iteracion;
let sizeArrayNumero;
let sizqArrayFruta;


arregloNUmero = [2,4,6,8,10,12,14,16,18];

sizeArrayNumero = arregloNUmero.length;
sizqArrayFruta = arregloFruta.length;

arregloFruta = ['Mora','Piña','Fresa','Limon','Naranja','Guanabana'];

console.log("Arreglo de Numeros: "+arregloNUmero);
console.log("Arreglo de Frutas: "+arregloFruta);

console.log("Mostrar Fruta: "+arregloFruta[3]);
console.log("Mostrar Numero: "+arregloNUmero[6]);

for(iteracion=0; iteracion<sizeArrayNumero;iteracion++){
    console.log("Numeros "+iteracion+": "+arregloNUmero[iteracion]);
}

let matriz = [];

matriz = [
    [2,3,4,5],
    [9,8,7],
    [3,5,7,8,9]
];

let sizeArrayMatriz = matriz.length;

console.log("Matriz");
console.log(matriz)

for(iteracion=0;iteracion<sizeArrayMatriz;iteracion++){
    let sizeInterno=matriz[iteracion].length;

    for(let contar = 0;contar<sizeInterno;contar++){
        console.log('Matriz: '+matriz[iteracion][contar]);
    }
}

