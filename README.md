# DataViz Lanirem

Ejercicios de visualización de datos de Lanirem, con algunas pruebas de concepto como el uso
de Quarto, paquetes de EDA y visualización.

###  Prueba de concepto Python y R en Quarto

Quarto markdown con de R y Python funcionales:


[Ejecución directa sin interacción](sudmex_conn/mix_lenguaje/mix_sin_interaccion.qmd)

Render HTML:
[Ejecución directa sin interacción](sudmex_conn/mix_lenguaje/mix_sin_interaccion.html)

Quarto markdown de interacción de R y Python con interacción entre sus variables generadas:


[Python y R con Reticulate](sudmex_conn/mix_lenguaje/mix_motor-reticulate.qmd)

Render HTML:
[Python y R con Reticulate](sudmex_conn/mix_lenguaje/mix_motor-reticulate.html)


### Quarto y Jupyter Notebook

Quarto puede correr en cualquier Jupyter Notebook con solo agregar una celda markdown al inicio. La principal ventaja
es que se puede obtener un output bien trabajado a partir de un jupyter notebook. Hay paquetes que logran algo similar,
quarto es una alternativa que puede funcionar con varios lenguajes y un solo programa instalado.

[EDA con Python](sudmex_conn/python/SUDMEX_CONN_Quatro.ipynb)

Render HTML:
[EDA con Python](sudmex_conn/python/SUDMEX_CONN_Quatro.html)

> Este notebook funciona con una instalación estándar de Jupyter notebook.
[Instalación de Jupyter Notebook](http://programacion.espol.edu.ec/%23/gu%C3%ADas-de-instalaci%C3%B3n/instalaci%C3%B3n-de-jupyter-notebook/)

### Quarto y R

Quarto al ser desarrollado por el equipo que creo Rmarkdown es compatible con este formato y funciona de forma nativa con
Rstudio. Sin embargo permite el uso de cualquier editor para generar estos archivos directamente. 

[EDA con R](sudmex_conn/r/analisis_R.qmd)


Render HTML:
[EDA con R](sudmex_conn/r/analisis_R.html)

> **Nota:**
> Para replicar estos ejercicios los paquetes necesarios  en los ejercicios, excepto en Python y R sin interacción, se usan
> los archivos  **requirements** para Python y en **renv.lock**. Esto es relevante para los Notebooks que hacen análisis
> EDA, en la mezcla de lenguajes solo es necesario instalar **Reticulate** en R y **Jupyter** en Python.
> 
> Para instalar los paquetes de Python:
> ```
>   pip install -r /path/to/requirements.txt
> ```
>
> Para python se puede usar **conda** que puede crear un ambiente virtual a partir de un archivo de _requirements_.
> Sin embargo estos archivos fueron ejecutados usando virtualenv incluido en Python [mas información](https://realpython.com/python-virtual-environments-a-primer/)
>
> Para instalar los paquetes de R
> 
> ```
>   install.packages('renv')
>   renv::restore()
> ```
> 
> Renv generará un ambiente de ejecución en la carpeta en uso [más información](https://rstudio.github.io/renv/articles/renv.html)


