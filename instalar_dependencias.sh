#!/bin/bash

clear
echo ""
echo " ========================================="
echo "  CrashMap Cartagena | Instalador"
echo " ========================================="
echo ""

# Seleccionar Python
if command -v python3 &> /dev/null; then
    PYTHON_CMD="python3"
else
    PYTHON_CMD="python"
fi

echo " Python: $PYTHON_CMD"
echo ""

cd "$(dirname "$0")/backend" || exit

echo " [1/3] Instalando dependencias base del backend..."
$PYTHON_CMD -m pip install fastapi uvicorn[standard] sqlalchemy python-multipart
$PYTHON_CMD -m pip install python-jose[cryptography] passlib[bcrypt] python-dotenv
$PYTHON_CMD -m pip install openpyxl "pydantic>=2.0"
echo ""

echo " [2/3] Instalando dependencias de IA y analisis..."
echo " (Esto puede tardar varios minutos)"
$PYTHON_CMD -m pip install numpy scikit-learn shapely
$PYTHON_CMD -m pip install torch --index-url https://download.pytorch.org/whl/cpu
$PYTHON_CMD -m pip install anthropic reportlab
echo ""

echo " [3/3] Instalando dependencias del frontend..."
cd "$(dirname "$0")/frontend" || exit
npm install
echo ""

echo " ========================================="
echo "  Instalacion completada"
echo " ========================================="
echo ""

read -p "Presiona ENTER para finalizar..."
