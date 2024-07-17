/**
 * Sergio Leguizamo
 */

document.addEventListener('DOMContentLoaded', function(){
    let bingo =[];
    let interno = [];
    let iteracion1;
    let iteracion2;
    let contador = 0;
    let tabla;
    let printResultado = '';
    let letras = ['B', 'I', 'N', 'G', 'O'];
    

    //Bingo
    console.log("\nBingo");
    for(iteracion1=0;iteracion1<5;iteracion1++){
        interno=[];
        for(iteracion2=0;iteracion2<5;iteracion2++){
            contador=contador+1;
            tabla=contador*3;
            interno.push(tabla);
        }
        bingo.push(interno);
    }
    console.log(bingo);

    //Bingo simple
    printResultado+='<table class="table"><tr>';
    for (let contadorB = 0; contadorB < letras.length; contadorB++) {
        printResultado+= '<th class = "borde color-letra">' + letras[contadorB] + '</th>';
    };
    printResultado+='</tr>';
    for(iteracion1 = 0; iteracion1 < 5; iteracion1++) {
        printResultado+='<tr>'
        for(iteracion2 = 0; iteracion2 < 5; iteracion2++) {
            printResultado+='<td class="borde">'+bingo[iteracion1][iteracion2]+'</td>';
        }
      printResultado+='</tr>';
    }
  printResultado+='</table>';

    
   //Bingo-letras
   for (iteracion1 = 0; iteracion1 < 5; iteracion1++) {
    printResultado += '<table class="table">';
    printResultado += '<tr>';

        for (let contadorB = 0; contadorB < letras.length; contadorB++) {
            printResultado += '<th class ="borde color-letra">' + letras[contadorB] + '</th>';
        };
        printResultado += '</tr>';
            for (let contador = 0; contador < 5; contador++) {
                printResultado += '<tr>';
                    for (iteracion2 = 0; iteracion2 < 5; iteracion2++) {
                        if (iteracion2 == iteracion1) {
                            printResultado += '<td class ="borde color-1"><strong>' + bingo[contador][iteracion2] + '</strong></td>';
                        } else {
                            printResultado += '<td class ="borde">' + bingo[contador][iteracion2] + '</td>';
                        };
                    };
                printResultado += '</tr>';
            };

    printResultado += '</table>';
    };



  //X grande
  printResultado+='<table class="table"><tr>';
  for (let contadorB = 0; contadorB < letras.length; contadorB++) {
      printResultado+= '<th class = "borde color-letra">' + letras[contadorB] + '</th>';
  };
  printResultado+='</tr>';
  for(iteracion1 = 0; iteracion1 < 5; iteracion1++) {
      printResultado+='<tr>'
      for(iteracion2 = 0; iteracion2 < 5; iteracion2++) {
          if(iteracion1 == iteracion2 || iteracion1 + iteracion2 == 4) {
             printResultado+='<td class="borde color-1">'+bingo[iteracion1][iteracion2]+'</td>';
          }else{
              printResultado+='<td class="borde">'+bingo[iteracion1][iteracion2]+'</td>';
          }
      }
      printResultado+='</tr>';
    }
  printResultado+='</table>';


//X varias

printResultado += '<table class="table"><tr>';
for (let contadorB = 0; contadorB < letras.length; contadorB++) {
    printResultado += '<th class = "borde color-letra">' + letras[contadorB] + '</th>';
}
printResultado += '</tr>';
for (iteracion1 = 0; iteracion1 < 5; iteracion1++) {
    printResultado += '<tr>';
    for (iteracion2 = 0; iteracion2 < 5; iteracion2++) {
        //X1

        if (iteracion1 <= 3 && iteracion2 >= 1 && iteracion2 <= 4 && iteracion1 % 2 == 0 && iteracion2 % 2 == 1) {
            printResultado += '<td class="color-1 borde">' + bingo[iteracion1][iteracion2] + '</td>';
        } else if (iteracion1 <= 2 && iteracion2 >= 1 && iteracion2 <= 2 && iteracion1 % 2 == 1 && iteracion2 % 2 == 0) {
            printResultado += '<td class="color-1 borde">' + bingo[iteracion1][iteracion2] + '</td>';
            //X2

        } else if (iteracion1>=2&&iteracion2<=3&&iteracion1%2==0&&iteracion2%2==0){
            printResultado += '<td class="color-2 borde">' + bingo[iteracion1][iteracion2] + '</td>';
        }else if (iteracion1>=2&&iteracion2<=2&&iteracion1%2==1&&iteracion2%2==1){
            printResultado += '<td class="color-2 borde">' + bingo[iteracion1][iteracion2] + '</td>';
            //X3

        }else if (iteracion1>=2&&iteracion2>=2&&iteracion1%2==0&&iteracion2%2==0){
            printResultado += '<td class="color-3 borde">' + bingo[iteracion1][iteracion2] + '</td>';
        }else if (iteracion1>=2&&iteracion2>=2&&iteracion1%2==1&&iteracion2%2==1){
            printResultado += '<td class="color-3 borde">' + bingo[iteracion1][iteracion2] + '</td>';
        }else{
            printResultado += '<td class="borde">' + bingo[iteracion1][iteracion2] + '</td>';
        }
    }
    printResultado += '</tr>';
}
printResultado += '</table>';
    
    document.getElementById('bingo-1').innerHTML = printResultado;
});
