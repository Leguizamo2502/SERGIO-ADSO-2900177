/**
 * Sergio Leguizamo
 * Bingo
 * 
 */

let bingo =[];
let iteracion1;
let iteracion2;
let contador = 0;
let tabla;
let letraB = [];
let letraI = [];
let letraN = [];
let letraG = [];
let letraO = [];

for(iteracion1=0;iteracion1<5;iteracion1++){
    let interno=[];
    for(iteracion2=0;iteracion2<5;iteracion2++){
        contador=contador+1;
        tabla=contador*3;
        interno.push(tabla);
    }
    bingo.push(interno);
}
console.log(bingo);

//letra B
for(iteracion1=0;iteracion1<5;iteracion1++){
    letraB.push(bingo[iteracion1][0]);
}
console.log("\nB");
console.log(letraB);

//Letra I
for(iteracion1=0;iteracion1<5;iteracion1++){
    letraI.push(bingo[iteracion1][1]);
}
console.log("\nI");
console.log(letraI);

//Letra N
for(iteracion1=0;iteracion1<5;iteracion1++){
    letraN.push(bingo[iteracion1][2]);
}
console.log("\nN");
console.log(letraN);

//Letra G
for(iteracion1=0;iteracion1<5;iteracion1++){
    letraG.push(bingo[iteracion1][3]);
}
console.log("\nG");
console.log(letraG);
//Letra O
for(iteracion1=0;iteracion1<5;iteracion1++){
    letraO.push(bingo[iteracion1][4]);
}
console.log("\nO");
console.log(letraO);

//X grande
console.log("\nX GRANDE")
