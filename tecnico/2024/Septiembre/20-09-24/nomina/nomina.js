function realizarOperaciones(){
    fetch('calcular.php',{
        method: 'POST',
        headers:{
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            diasTrabajados: 30,
            valorDia: 50000
        })
    })
    .then(response =>response.json())
    .then(data=>{
        if (data.error){
            alert(data.error);
        }else{
            document.getElementById('salario').textContent=`Salario Bruto: ${data.salario}`;
            document.getElementById('salud').textContent=`Salud: ${data.salud}`;
            document.getElementById('pension').textContent=`Pension: ${data.pension}`;
            document.getElementById('arl').textContent=`Arl: ${data.arl}`;
            document.getElementById('descuento').textContent=`Descuento: ${data.descuento}`;
            document.getElementById('subTransporte').textContent=`Subsidio de Transporte: ${data.subTransporte}`;
            document.getElementById('retencion').textContent=`Retencion: ${data.retencion}`;
            document.getElementById('pagoTotal').textContent=`Pago Total: ${data.pagoTotal}`;
        }
    })
    .catch(error=>console.error('Error:',error));

}
document.addEventListener("DOMContentLoaded",function(){
    realizarOperaciones();
})