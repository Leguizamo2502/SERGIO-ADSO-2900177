# Manual de Markdown en Git

## Encabezados
Para crear un encabezado, utilice el símbolo de almohadilla (#) al principio de una línea:

# Nivel 1 (Titulo articulo)
## Nivel 2
### Nivel 3
#### Nivel 4
##### Nivel 5

# Texto básico
En Markdown, un párrafo no requiere una sintaxis especial.

Para aplicar negrita al texto, se escribe entre dos asteriscos. Para aplicar cursiva al texto, se escribe entre un solo asterisco:

Este texto está `**en negrita**`.
Este texto está `*en cursiva*`.
Este texto está `***en negrita y cursiva***`.
Para ignorar los caracteres de formato de Markdown, coloca una barra invertida \ antes del carácter:

Esto no está `\*en cursiva\*`.


# Listas numeradas y listas con viñetas

Para crear listas numeradas, inicia una línea con 1. o 1, pero no mezcles los formatos dentro de la misma lista. No es necesario especificar los números; GitHub lo hace automáticamente por ti.

`1. Este es el paso 1`.
``1. Este es el siguiente paso`.
`1. Este es otro paso, el tercero`.

Para crear listas de viñetas, inicia una línea con *, - o +, pero no mezcles los formatos dentro de la misma lista.

`* Primer elemento en una lista desordenada.`
`* Otro elemento.`
`* Aquí vamos de nuevo.`

También puedes incrustar listas dentro de listas y añadir contenido entre elementos de la lista.

1. Configura tu tabla y bloques de código.
1. Realiza este paso.
  `![tabla estilos](img1.jpg)`

    ![tabla estilos](imagenes/img1.png)

1. Asegúrate de que tu tabla luzca así:

   `| Hola | Mundo |`

    `| --- | --- |`

  `| ¿Cómo | estás? |`
  
   | Hola | Mundo |
   | --- | --- |
   | ¿Cómo | estás? |

1. Este es el cuarto paso.

  ` >[!NOTA]`

   `>`

  ` >Este es un texto de nota.`
    
    >[!NOTA]
    >
    >Este es un texto de nota.


#Tablas
Las tablas no forman parte de la especificación principal de Markdown, pero Adobe las admite en cierta medida. Markdown no admite listas de líneas múltiples en celdas. La práctica recomendada es evitar el uso de varias líneas en las tablas. Puede crear tablas utilizando la barra vertical (|) para definir columnas y filas. Los guiones crean el encabezado de cada columna, mientras que las barras verticales separan las columnas. Incluya una línea en blanco antes de la tabla para que se muestre correctamente.

``| Encabezado | Encabezado 2 | Encabezado 3 |``

``|--- |--- |--- |``

``| fila 1 | columna 2 | columna 3 |``

``| fila 2 | fila 2 2 columna 2 | fila 2 columna 3 |``

| Encabezado | Encabezado  2 | Encabezado 3 |
|-------------|------------------|-----------|
| Fila 1 Col 1 | Fila 1 Col 2 | Fila 1 Col 3 |  
| fila 2 col 2 | fila 2 col 2 | fila 2 col 3 |

Las tablas sencillas funcionan correctamente en Markdown. Sin embargo, es difícil trabajar con tablas que incluyen varios párrafos o listas dentro de una celda. Para dicho contenido, recomendamos utilizar un formato diferente, como encabezados y texto.

# Vinculos
La sintaxis Markdown para un vínculo en línea consiste en la parte [link text], que es el texto que se va a hipervincular, seguido de la parte (file-name.md), que es la URL o el nombre de archivo al que se va a vincular:

``[link text](file-name.md)``

[Ronaldo](https://www.instagram.com/cristiano/)





