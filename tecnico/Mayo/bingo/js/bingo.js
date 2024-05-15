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
let par = 0;
let impar = 0;

//Bingo
console.log("\nBingo");
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
for(let iteracion1 = 0; iteracion1 < 5; iteracion1++) {
  for(let iteracion2 = 0; iteracion2 < 5; iteracion2++) {
      if(iteracion1 == iteracion2 || iteracion1 + iteracion2 == 4) {
          console.log(bingo[iteracion1][iteracion2]);
      }
  }
}

//X1
console.log("\nX1");
for (let iteracion1 = 0; iteracion1 < 3; iteracion1++) {
  for (let iteracion2 = 1; iteracion2 < 4; iteracion2++) {
    if (iteracion1%2==0&&iteracion2%2==1){
      console.log(bingo[iteracion1][iteracion2]);
    }else if (iteracion1%2==1&&iteracion2%2==0){
      console.log(bingo[iteracion1][iteracion2]);
    }else{
      console.log("")
    }
  }
}

//X2
console.log("\nX2");
for (let iteracion1 = 2; iteracion1 < 5; iteracion1++) {
  for (let iteracion2 = 2; iteracion2 < 5; iteracion2++) {
    if (iteracion1%2==0&&iteracion2%2==0){
      console.log(bingo[iteracion1][iteracion2]);
    }else if (iteracion1%2==1&&iteracion2%2==1){
      console.log(bingo[iteracion1][iteracion2]);
    }else{
      console.log("")
    }
  }
}

//X3
console.log("\nX3");
for (let iteracion1 = 2; iteracion1 < 5; iteracion1++) {
  for (let iteracion2 = 2; iteracion2 < 5; iteracion2++) {
    if (iteracion1%2==0&&iteracion2%2==0){
      console.log(bingo[iteracion1][iteracion2]);
    }else if (iteracion1%2==1&&iteracion2%2==1){
      console.log(bingo[iteracion1][iteracion2]);
    }else{
      console.log("")
    }
  }
}

//Par o impar
console.log("\nPar e impar");
for (let iteracion1 = 0; iteracion1 < 5; iteracion1++) {
  for (let iteracion2 = 0; iteracion2 < 5; iteracion2++) {
    if (iteracion1%2==0&&iteracion2%2==0){
      par++;
    }else{
      impar++;
    }
  }
}
console.log("Hay " + par + " pares");
console.log("Hay " + impar + " impares");

