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

`1. Este es el siguiente paso`.

`1. Este es otro paso, el tercero`.

1. Este es el paso 1.

1. Este es el siguiente paso.

1. Este es otro paso, el tercero.


Para crear listas de viñetas, inicia una línea con *, - o +, pero no mezcles los formatos dentro de la misma lista.

`* Primer elemento en una lista desordenada.`

`* Otro elemento.`

`* Aquí vamos de nuevo.`

* Primer elemento en una lista desordenada.

* Otro elemento.

* Aquí vamos de nuevo.



# Tablas
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

Para vínculos a artículos (referencias cruzadas) dentro del repositorio, utilice vínculos relativos. Puede utilizar todos los operandos de vínculos relativos, como ./ (directorio actual), …/ (atrás un directorio) y …/…/ (atrás dos directorios).

`See [Overview example article](../../overview.md)`

# Imagenes

Para agregar imagenes se debe hacer lo siguiente:

 `![tabla estilos](img1.jpg)`

![tabla estilos](imagenes/img1.png)

# Bloques de código
Markdown admite la colocación de bloques de código tanto en línea como en un bloque “delimitado” independiente entre frases. Para obtener más información, consulte Compatibilidad nativa de Markdown para bloques de código (en inglés).

Utilice comillas invertidas (``) para crear estilos de código en línea dentro de un párrafo. Para crear un bloque de código multilínea específico, agregue tres comillas invertidas antes y después del bloque de código (denominado “bloque de código delimitado” en Markdown y “componente de bloque de código” en AEM). Para bloques de código delimitado, agregue el lenguaje del código después del primer conjunto de comillas invertidas para que Markdown resalte correctamente la sintaxis del código. 

ejemplo: 

Este es un `código en línea` dentro de un párrafo de texto.

# Extensiones de Markdown personalizadas
En los artículos de Adobe se utiliza la puntuación estándar para la mayoría de los formatos de artículo, como párrafos, vínculos, listas y encabezados. Para obtener un formato enriquecido, los artículos pueden utilizar funciones ampliadas de Markdown, como:

Bloques de notas
Vídeos incrustados
Etiquetas de traducción
Propiedades del componente, como asignar un ID de encabezado diferente a un encabezado y especificar un tamaño de imagen
Utilice el símbolo de citas de bloque de Markdown (>) al principio de cada línea para enlazar un componente ampliado, como una nota.

Algunos elementos comunes de Markdown, como encabezados y bloques de código, incluyen propiedades ampliadas. Si necesita cambiar las propiedades predeterminadas, agregue los parámetros entre llaves /{ /} después del componente. Las propiedades ampliadas se describen en contexto.
## Bloques de notas
Bloques de notas
Puede elegir entre estos tipos de bloques de notas para llamar la atención sobre un contenido específico:

`[!NOTE]`

``[!TIP]``

``[!IMPORTANT]``

``[!CAUTION]``

``[!WARNING]``

``[!ADMINISTRATION]``

``[!AVAILABILITY]``

 ``[!PREREQUISITES``

``[!ERROR]``

``[!INFO]``


``[!SUCCESS]``

En general, los bloques de notas deben usarse con moderación porque pueden resultar molestos. Aunque también se admiten bloques de código, imágenes, listas y vínculos, intente que los bloques de notas sean simples y directos.

>[!NOTE]
>
>Esto es un bloque de nota estandar.

>[!TIP]
>
>Esto es un bloque de TIP estandar.

>[!IMPORTANT]
>
>ESto es un bloque de IMPORTANT estandar.


En general, los bloques de notas deben usarse con moderación porque pueden resultar molestos. Aunque también se admiten bloques de código, imágenes, listas y vínculos, intente que los bloques de notas sean simples y directos.




