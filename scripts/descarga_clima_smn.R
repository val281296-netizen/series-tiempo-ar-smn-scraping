# scripts/descarga_clima_smn.R
library(readr)
library(dplyr)
library(lubridate)

# URL del ZIP oficial del SMN (datos abiertos)
zip_url <- "https://datos.gob.ar/dataset/smn-datos-meteorologicos-horarios/archivo/smn_2.1"

# Descargar ZIP a un archivo temporal
temp_zip <- tempfile(fileext = ".zip")
download.file(zip_url, temp_zip, mode = "wb")

# Crear directorio temporal para extraer
temp_dir <- tempdir()
unzip(temp_zip, exdir = temp_dir)

# Leer todos los CSV/TXT descomprimidos
files <- list.files(temp_dir, pattern = "\\.csv$|\\.txt$", full.names = TRUE)
list_data <- lapply(files, read_csv)

# Combinar todos en un solo data frame
clima_smn <- bind_rows(list_data)

# Guardar CSV final en la raíz del repositorio
write_csv(clima_smn, "clima_smn_horarios.csv")
cat("Archivo clima_smn_horarios.csv generado correctamente\n")
