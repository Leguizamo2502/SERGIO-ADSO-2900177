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
    let contadorB = 0;
    

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
   printResultado += '<table class="table"><tr>';
   for(contadorB=0;contadorB<5;contadorB++){
    printResultado += '<th scope="col" class ="color-letra borde">'+letras[contadorB]+'</th>';
   }
   printResultado += '</tr>';
   for(iteracion1=0;iteracion1<5;iteracion1++){
    printResultado += '<tr>';
    for(iteracion2=0;iteracion2<5;iteracion2++){
        printResultado += '<td class="borde tabla-color">'+bingo[iteracion1][iteracion2]+'</td>';
    }
    printResultado += '</tr>';
   }
   printResultado += '</table>';

   //letras

   for(contador=0;contador<5;contador++){
        printResultado += '<table class="table"><tr>';
        for(contadorB=0;contadorB<letras.length;contadorB++){
         printResultado += '<th class ="color-letra borde">'+letras[contadorB]+'</th>';
        }
        printResultado += '</tr>';
        for(iteracion1=0;iteracion1<5;iteracion1++){
            printResultado += '<tr>';
            for(iteracion2=0;iteracion2<5;iteracion2++){
                if(iteracion2==contador){
                    printResultado+= '<td class="borde tabla-color color-l">'+bingo[iteracion1][iteracion2]+'</td>'
             }else{
                printResultado+= '<td class="borde tabla-color">'+bingo[iteracion1][iteracion2]+'</td>'
            }
        }
        printResultado += '</tr>';
        }
        printResultado += '</table>';
    }

    //Bingo con X grande 
    printResultado += '<table class="table"><tr>';
    for(contadorB=0;contadorB<5;contadorB++){
        printResultado += '<th scope="col" class ="color-letra borde">'+letras[contadorB]+'</th>';
    }
    printResultado += '</tr>';
    for(iteracion1=0;iteracion1<5;iteracion1++){
        printResultado += '<tr>';
        for(iteracion2=0;iteracion2<5;iteracion2++){
            if(iteracion1==iteracion2 || iteracion1+iteracion2==4){
                printResultado += '<td class="borde tabla-color color-x grande">'+bingo[iteracion1][iteracion2]+'</td>';
            }else{
                printResultado += '<td class="borde tabla-color">'+bingo[iteracion1][iteracion2]+'</td>';
            }
        }
        printResultado += '</tr>';
    }    
    printResultado += '</table>';

    //x varias


    
    
document.getElementById('bingo-1').innerHTML = printResultado;
});