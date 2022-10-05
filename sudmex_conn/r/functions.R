library(rvest)
library(dplyr)
library(purrr)
library(here)


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

