/**
 * Funciones
 * Autor: Sergio Andres Leguizamo
 * Fecha: Lunes 01 de abril de 2024
 * 
 */

function sumaNota(pnota1, pnota2, pnota3) {
    let sumarNotas 
    let promedio
    let nota1 = pnota1;
    let nota2 = pnota2;
    let nota3 = pnota3;
    sumarNotas = nota1 + nota2 + nota3;
    promedio = (nota1 + nota2 + nota3)/3;
    return promedio;
}