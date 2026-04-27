#!/bin/bash

clear
echo ""
echo " ========================================="
echo "  CrashMap Cartagena | Backend FastAPI"
echo " ========================================="
echo ""
echo " URL:  http://localhost:8000"
echo " Docs: http://localhost:8000/docs"
echo ""

cd "$(dirname "$0")/backend" || exit

# Python
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
else
    PYTHON_CMD="python"
fi

echo " Python: $PYTHON_CMD"
echo ""

echo " Verificando dependencias..."
$PYTHON_CMD -c "import fastapi, uvicorn, sqlalchemy, jose, passlib" &> /dev/null

if [ $? -ne 0 ]; then
    echo " [AVISO] Instalando dependencias..."
    $PYTHON_CMD -m pip install -r requirements.txt
fi

# Verificar puerto 8000
if ss -tuln | grep -q ":8000"; then
    echo " [AVISO] El puerto 8000 ya está en uso"
fi

echo ""
echo " Iniciando servidor..."
echo ""

$PYTHON_CMD -m uvicorn main:app --reload --host 0.0.0.0 --port 8000

if [ $? -ne 0 ]; then
    echo ""
    echo " [ERROR] No se pudo iniciar el backend"
    echo " Ejecuta: pip install -r requirements.txt"
fi

read -p "Presiona ENTER para salir..."
