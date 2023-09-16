---
title: Métodos de generación de números aleatorios
author: Tarea, Simulación
output:
  pdf_document: default
  html_document: default
---


# Números aleatorios no-uniformoes

Recuerda cargar todas las librerías que necesitamos. Para esto necesitas 
ejecutar las siguiente líneas. 

```{r setup}
# Reparamos ambiente de trabajo
renv::restore()
# Cargamos librerías útiles
library(tibble)
library(ggplot2)
library(patchwork)

```

También podrás correr el siguiente bloque de código por si quieres generar el `pdf` y 
tenerlo compilado para tu referencia. 

```{r compile-pdf, eval = FALSE, include = FALSE}
rmarkdown::render(
  "assignment.Rmd", 
  output_file = "assignment.pdf",
  clean = TRUE
  )
```

## Cauchy 

Para este ejercicio se utilizará el teorema de la función inversa. Para esto 
considera que la función de acumulación de una Cauchy es
$$\mathbb{P}(x) = \frac{1}{2} + \frac{1}{\pi} \mathsf{arctan}((x - \mu)/\beta)\,.$$

*Nota*: La función `pcauchy.inv` se importará en el ambiente de trabajo al momento de
calificar la tarea.

```{r cauchy}
pcauchy.inv <- function(u, mu, beta){
    # Escribe aqui el código para calcular la función de acumulación inversa
    # de una Cauchy. 
    
  
    return(u)
}
```

Verificaremos que existe un empate entre la distribución que decimos que estamos
generando. Primero generamos números aleatorios: 

```{r muestreo cauchy, error = TRUE}
# Pondremos a prueba el código de tu función de arriba. 
nsamples <- 10^4
mu <- 0; beta <- 1
# Generamos uniformes 
U <- runif(nsamples) 
# Deberían de ser Cauchy(mu, beta)
X <- pcauchy.inv(U, mu, beta)
```

Ahora lo mostraremos graficamente en la siguiente figura. 

```{r grafico cauchy, error = TRUE}

tibble(samples = ) |> # Completa con el arreglo adecuado para el gráfico. 
  ggplot(aes(samples)) + 
    geom_histogram(aes(y = ..density..), color = "white")  + 
    geom_function(fun = dcauchy, 
                  args = list(location = mu, scale = beta), 
                  color = 'salmon', lwd = 1.5) + 
    xlim(-5, 5)
 
```


## Gamma a partir de exponenciales

Este ejercicio servirá para generar una variable aleatoria
$\mathsf{Gamma}(\alpha, \beta)$ a partir de números aleatorios
uniformes.

Recuerda que la caracterización es para $\alpha \in \mathbb{N}$. Así
que consideraremos $\alpha = 5$.

```{r gamma, error = TRUE}
  # =========================================================================  
  # Inputs: n = # de muestras
  # Outpus: x = vector de numeros aleatorios
  # =========================================================================  
  # Modifica aqui el código para generar el vector `x` de numeros
  # pseudo-aleatorios. Ojo: No utilices funciones que hayas definido arriba. Es
  # decir, el código deber de ser autocontenido.
  alpha <- 5; beta <- 2.3
  u <- runif(alpha * n)
  x <- u
  # =========================================================================  
```

Otra vez, veremos que tenemos un buen empate gráfico con la distribución deseada.

```{r, error = TRUE}

tibble(samples = ) |> #Completa el código con el arreglo necesario.
  ggplot(aes(samples)) + 
    geom_histogram(aes(y = ..density..), color = "white")  + 
    geom_function(fun = dgamma, 
                  args = list(shape = 5, scale = 2.3), 
                  color = 'salmon', lwd = 1.5) 

```

## Mezcla Beta-Binomial 

Ahora utilizaremos caracterización de una Beta-Binomial. En el siguiente bloque
escribe el código que genera de la distribución conjunta. Revisa también el bloque 
`plot-betabinom` para que se te "ocurran" los nombres de las variables.


```{r}
n <- 20; alpha <- 2; beta <- 5

```

Ahora, veremos la distribución conjunta y las marginales. 

```{r plot-betabinom, error = TRUE}
g.joint <- tibble(theta, y) |> 
  ggplot(aes(theta, y)) + 
  geom_point(alpha = .4)

g.y <- tibble(y) |> 
  ggplot(aes(y)) + 
  geom_histogram(binwidth = 1) + xlab("") +
  coord_flip() 

g.theta <- tibble(theta) |> 
  ggplot(aes(theta)) + 
  geom_histogram() + xlab("")

(g.theta + plot_spacer() + g.joint + g.y) + 
  plot_layout(ncol = 2, nrow = 2, widths = c(4, 1), heights = c(1, 4))
```

*Pregunta*: ¿Qué es lo que se está gráficando en los histogramas? ¿Qué relación
tienen estos histogramas con la distribución conjunta? Es decir, ¿cómo están relacionado el diagrama de dispersión con los histogramas en los ejes?

## Prueba de hipótesis de números aleatorios

Replica la prueba $\chi^2$ que vimos en clase para: 
1) Generar números $\mathsf{Poisson}(7)$ utilizando la técnica de discretización de uniformes.
2) Generar números $\mathsf{Gamma}(5, 2)$ utilizando la técnica de suma de exponenciales.

Contrasta para diferentes tamaños de muestra
$$n = 30, 100, 500\,.$$

```{r}

```