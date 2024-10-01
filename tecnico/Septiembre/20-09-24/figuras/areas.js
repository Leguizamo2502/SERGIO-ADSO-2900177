function realizarOperaciones(){
    fetch('calcular.php',{
        method: 'POST',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            lado: 8,
            base: 8,
            altura: 10
        })
    })
    .then(response =>response.json())
    .then(data=>{
        if (data.error){
            alert(data.error);
        }else{
            document.getElementById('areaCuadrado').textContent=`Area Cuadrado: ${data.cuadrado}`;
            document.getElementById('areaRectangulo').textContent=`Area Rectangulo: ${data.rectangulo}`;
            document.getElementById('areaTriangulo').textContent=`Area Triangulo: ${data.triangulo}`;
           
        }
    })
    .catch(error=>console.error('Error:',error));

}
document.addEventListener("DOMContentLoaded",function(){
    realizarOperaciones();
})