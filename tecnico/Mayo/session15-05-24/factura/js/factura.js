/**
 * Sergio Leguizamo
 * Factira llave de valor
 * 15-05-24
 * 
 */
let factura = [];
let valorTotal;
let iteracion;
let totalPaga = [];
let totalPagoProducto;

factura=[
    {codigo:1,nombreProducto:'Malteada',cantidad:2,valorUnidad:12000},
    {codigo:2,nombreProducto:'Picada',cantidad:3,valorUnidad:25000},
    {codigo:3,nombreProducto:'Hamburguesa mixta',cantidad:4,valorUnidad:16000},
    {codigo:4,nombreProducto:'Churrasco',cantidad:3,valorUnidad:25000},
    {codigo:5,nombreProducto:'Gaseosa',cantidad:5,valorUnidad:5000},
    {codigo:6,nombreProducto:'Limonda',cantidad:5,valorUnidad:6000}
];
/*
valorTotal = factura[3].cantidad * factura[3].valorUnidad;
console.log(factura[3].nombreProducto);
console.log("Valor total "+valorTotal)
*/

for(iteracion=0;iteracion<factura.length; iteracion++){
    totalPagoProducto = factura[iteracion].cantidad * factura[iteracion].valorUnidad;
    totalPaga.push({nombreProducto:factura[iteracion].nombreProducto, cantidad:factura[iteracion].cantidad, valorUnidad:factura[iteracion].valorUnidad, total:totalPagoProducto});
}
console.log(totalPaga)