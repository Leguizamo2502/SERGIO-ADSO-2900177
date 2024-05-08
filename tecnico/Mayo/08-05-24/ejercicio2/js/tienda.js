/**
 * Tienda con arreglos
 * Sergio Leguizamo
 */

let tienda = [];
let iteracion;
tienda = [
    {id:1, nombreProducto:'lenteja', tipoProducto:'granos',cantidad:1000,tipoCantidad:'granos',precio:2300},
    {id:2, nombreProducto:'frijol', tipoProducto:'granos',cantidad:500,tipoCantidad:'granos',precio:2500},
    {id:3, nombreProducto:'pollo entero', tipoProducto:'carnes',cantidad:1000,tipoCantidad:'carnes',precio:3000},
    {id:4, nombreProducto:'carne de cerdo', tipoProducto:'carnes',cantidad:500,tipoCantidad:'carnes',precio:2300},
    {id:5, nombreProducto:'mora', tipoProducto:'frutas',cantidad:500,tipoCantidad:'frutas',precio:2300},
    {id:6, nombreProducto:'uva', tipoProducto:'frutas',cantidad:1000,tipoCantidad:'frutas',precio:2300},
    {id:7, nombreProducto:'tomate', tipoProducto:'verduras',cantidad:500,tipoCantidad:'verduras',precio:2400},
]
console.log(tienda)

for(iteracion=0;iteracion<7;iteracion++){
    if(tienda[iteracion].cantidad<=500 && tienda[iteracion].tipoProducto=='granos'){
        console.log("Posicion "+iteracion+": ");
        console.log(tienda[iteracion])
    }else{
        console.log("-")
    }
    
}