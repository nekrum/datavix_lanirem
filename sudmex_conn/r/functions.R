library(rvest)
library(dplyr)
library(purrr)
library(here)


sitio <- c('https://zenodo.org/')
pagina <- c('record/5123331')

dir.create(here('descargas'), showWarnings=FALSE)

ObtenerFuentesArchivos <- function(sitio, pagina, directorio_descargas) {
    contenido <- read_html(paste0(sitio, pagina)) 
    contenido %>% 
        html_nodes('.filename') %>%
        html_attr('href') %>%
        paste0(sitio, .) %>%
        tibble(url=.) %>%
        mutate(
            file=unlist(map(strsplit(url, '/'), `[`, 8)),
            file=gsub('\\.xlsx.*', '.xlsx', file),
            file=gsub('%', '_', file),
            destino=here('descargas', file)
        ) %>%
        select(url, destino)
}


DescargaArchivos <- function(df_fuentes) {
    pwalk(
        df_fuentes,
        ~ download.file(.x, .y)
    )
}

