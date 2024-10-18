const app = new (function(){
    this.tbody = document.getElementById('tbody');
    this.nombres = document.getElementById('nombres');
    this.email = document.getElementById('email');
    this.edad = document.getElementById('edad');
    this.listado = ()=>{
        fetch('../../listado.php')
        .then((res)=>{
            if (!res.ok) {
                throw new Error('Error en la respuesta del servidor');
            }
            return res.json();
        })
        .then((data)=>{
            this.tbody.innerHTML = "";
            data.forEach((item)=>{
                this.tbody.innerHTML +=`<tr>
                    <td>${item.id}</td>
                    <td>${item.nombres}</td>
                    <td>${item.email}</td>
                    <td>${item.edad}</td>
                    <td>
                        <a href="javascript:;" class="btn btn-warning btn-sm" onclick="app.editar(${item.id})">Editar</a> 
                        <a href="javascript:;" class="btn btn-warning btn-sm" onclick="app.eliminar(${item.id})">Eliminar</a> 
                    </td>
                
                </tr>`
            })
        })
        .catch((error)=>console.log(error))
    }
    this.guardar = () => {
        var form = new FormData();
        form.append("nombres", this.nombres.value);
        form.append("email", this.email.value);
        form.append("edad", this.edad.value);
    
        fetch('../..//guardar.php', {
            method: 'POST',
            body: form,
        })
        .then((res) => {
            if (!res.ok) {
                throw new Error('Error en la respuesta del servidor');
            }
            return res.json(); // Trata de convertir la respuesta en JSON
        })
        .then((data) => {
            if (data.error) {
                console.error('Error de SQL:', data.message); // Muestra el error de SQL
            } else {
                console.log('Datos guardados correctamente:', data);
            }
        })
        .catch((error) => {
            console.error('Error de red:', error);
        });
    };
    
})();
app.listado();