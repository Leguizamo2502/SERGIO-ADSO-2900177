/**
 * Sergio Leguizamo
 */

    document.addEventListener('DOMContentLoaded', function(){
        let tabla = [];
        let multiplo = [];
        let iteracionTabla;
        let iteracionMultiplo;
        let numeroTabla;
        let numeroMultiplo;
        let resultado;
        let printResultado = '';
    
        for(iteracionTabla = 0; iteracionTabla < 6; iteracionTabla++){
            multiplo = [];
            numeroTabla = iteracionTabla + 1;
    
            for(iteracionMultiplo = 0; iteracionMultiplo < 10; iteracionMultiplo++) {
                numeroMultiplo = iteracionMultiplo + 1;
                resultado = numeroTabla * numeroMultiplo;
                multiplo.push(resultado);
            }
            tabla.push(multiplo);
        }
    
        console.log(tabla);
        for(iteracionTabla = 0; iteracionTabla < tabla.length; iteracionTabla++){
            numeroTabla = iteracionTabla + 1;
            printResultado += '<div class="accordion-item">';
            printResultado += '<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse' + numeroTabla + '" aria-expanded="false" aria-controls="flush-collapse' + numeroTabla + '">';
            printResultado += 'Tabla de multiplicar #' + numeroTabla;
            printResultado += '</button>';
            printResultado += '<div id="flush-collapse' + numeroTabla + '" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample">';
            
            for(iteracionMultiplo = 0; iteracionMultiplo < 10; iteracionMultiplo++){
                numeroMultiplo = iteracionMultiplo + 1;
    
                printResultado += '<div class="accordion-body" style="padding: 0 !important;">';
                printResultado += '<table class="table">';
                printResultado += '<tr style="padding:0;margin:0;"><td style="padding:0;margin:0;">' + numeroTabla + ' X ' + numeroMultiplo + ' = ' + tabla[iteracionTabla][iteracionMultiplo] + '</td></tr>';
                printResultado += '</table>';
                printResultado += '</div>';
            }
            
            printResultado += '</div>';
            printResultado += '</div>';
        }
        document.getElementById('accordionFlushExample').innerHTML = printResultado;
    });
    