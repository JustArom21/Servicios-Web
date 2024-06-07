document.addEventListener('DOMContentLoaded', function() {
    const listaUsuarios = document.getElementById('lista-usuarios');
    const formIndicadores = document.getElementById('form-indicadores');
    const formMetas = document.getElementById('form-metas');

    function obtenerUsuarios() {
        fetch('http://localhost:3000/usuarios')
            .then(response => response.json())
            .then(data => {
                listaUsuarios.innerHTML = '';
                data.forEach(usuario => {
                    const li = document.createElement('li');
                    li.textContent = `${usuario.ID} - ${usuario.Nombre} (${usuario.Edad} años, ${usuario.Genero})`;
                    listaUsuarios.appendChild(li);
                });
            })
            .catch(error => console.error('Error:', error));
    }

    formIndicadores.addEventListener('submit', function(event) {
        event.preventDefault();
        const tipoIndicador = document.getElementById('tipo-indicador').value;
        const valor = document.getElementById('valor').value;
        const fechaHora = document.getElementById('fecha-hora').value;
        const notas = document.getElementById('notas').value;
        const usuarioId = document.getElementById('usuario-id').value;

        fetch('http://localhost:3000/indicadores', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                Tipo_Indicador: tipoIndicador,
                Valor: valor,
                Fecha_Hora: fechaHora,
                Notas_Adicionales: notas,
                Usuario_ID: usuarioId
            })
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            formIndicadores.reset();
        })
        .catch(error => console.error('Error:', error));
    });

    formMetas.addEventListener('submit', function(event) {
        event.preventDefault();
        const nombreMeta = document.getElementById('nombre-meta').value;
        const valorObjetivo = document.getElementById('valor-objetivo').value;
        const fechaInicio = document.getElementById('fecha-inicio').value;
        const fechaFin = document.getElementById('fecha-fin').value;
        const usuarioIdMeta = document.getElementById('usuario-id-meta').value;

        fetch('http://localhost:3000/metas', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                Nombre_Meta: nombreMeta,
                Valor_Objetivo: valorObjetivo,
                Fecha_Inicio: fechaInicio,
                Fecha_Fin: fechaFin,
                Usuario_ID: usuarioIdMeta
            })
        })
        .then(response => response.json())
        .then(data => {
            alert(data.message);
            formMetas.reset();
        })
        .catch(error => console.error('Error:', error));
    });

    obtenerUsuarios();
});
