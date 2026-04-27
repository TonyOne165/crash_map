#!/bin/bash

clear
echo ""
echo " ========================================="
echo "  CrashMap Cartagena | Setup Base de Datos"
echo " ========================================="
echo ""
echo " Este script crea la base de datos SQLite y carga"
echo " los datos reales de accidentalidad de Cartagena."
echo ""
echo " Base de datos: backend/accidentes.db (SQLite - no requiere servidor)"
echo ""
read -p "Presiona ENTER para continuar..."

# Ir a la carpeta backend (ruta relativa al script)
cd "$(dirname "$0")/backend" || {
    echo "[ERROR] No se pudo acceder a la carpeta backend"
    exit 1
}

# Seleccionar Python
PYTHON_CMD=""

if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
    echo " Python encontrado: python3"
elif command -v python &> /dev/null; then
    PYTHON_CMD="python"
    echo " Usando Python del sistema (python)"
else
    echo "[ERROR] Python no está instalado"
    exit 1
fi

echo ""

# Verificar que existe setup_database.py
if [ ! -f "setup_database.py" ]; then
    echo " [ERROR] No se encontró setup_database.py en la carpeta backend/"
    echo ""
    read -p "Presiona ENTER para salir..."
    exit 1
fi

echo " Configurando base de datos y cargando datos..."
echo ""

$PYTHON_CMD setup_database.py

if [ $? -ne 0 ]; then
    echo ""
    echo " [ERROR] Ocurrió un error al configurar la base de datos."
    echo " Revisa que todas las dependencias estén instaladas:"
    echo "   pip install -r requirements.txt"
    echo ""
else
    echo ""
    echo " ========================================="
    echo "  Base de datos configurada correctamente"
    echo " ========================================="
    echo ""
    echo " Ahora puedes iniciar el backend y el frontend."
    echo ""
fi

read -p "Presiona ENTER para finalizar..."
