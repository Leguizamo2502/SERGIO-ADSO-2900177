/**
 * Sergio Leguizamo
 */

const cedula = document.getElementById('cedula');
const nombre = document.getElementById('nombre');
const apellido = document.getElementById('apellido');
const edad = document.getElementById('edad');
const estrato = document.getElementById('estrato');
const valorDia = document.getElementById('valorDia');
const diasTra = document.getElementById('diasTra');
const bottoncal = document.getElementById('calcular')

bottoncal.addEventListener('click',calcular);