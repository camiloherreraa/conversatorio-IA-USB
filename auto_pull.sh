#!/bin/bash

# Directorio donde está el repositorio
REPO_DIR="/var/www/html/conversatorio-ia"

# Cambia al directorio del repositorio
cd $REPO_DIR

# Realiza la verificación cada minuto
while true; do
  echo "Verificando cambios en el repositorio..."
  
  # Trae las actualizaciones remotas sin hacer pull todavía
  git fetch origin

  # Compara el estado del repositorio local con el remoto
  LOCAL=$(git rev-parse @)
  REMOTE=$(git rev-parse @{u})

  if [ $LOCAL != $REMOTE ]; then
    echo "Hay cambios nuevos, actualizando el repositorio..."
    git pull origin main  # Cambia 'main' si usas otra rama
  else
    echo "No hay cambios en el repositorio."
  fi

  sleep 60  # Espera 60 segundos antes de verificar nuevamente
done

