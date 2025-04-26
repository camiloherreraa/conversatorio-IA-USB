#!/bin/bash

# Directorio donde está el repositorio
REPO_DIR="/var/www/html/conversatorio-ia"

# Cambia al directorio del repositorio
cd $REPO_DIR

echo "Verificando cambios en el repositorio..."
  
# Trae las actualizaciones remotas sin hacer pull todavía
git fetch origin

# Descarta cualquier cambio local no comprometido
git reset --hard

# Compara el estado del repositorio local con el remoto
LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ $LOCAL != $REMOTE ]; then
  echo "Hay cambios nuevos, actualizando el repositorio..."
  git pull origin main  # Cambia 'main' si usas otra rama
else
  echo "No hay cambios en el repositorio."
fi


