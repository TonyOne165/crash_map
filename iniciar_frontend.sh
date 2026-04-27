#!/bin/bash

clear
echo ""
echo " ========================================="
echo "  CrashMap Cartagena | Frontend React"
echo " ========================================="
echo ""
echo " URL: http://localhost:3000"
echo ""

cd "$(dirname "$0")/frontend" || exit

# Instalar si no existe node_modules
if [ ! -d "node_modules" ]; then
    echo " [AVISO] Instalando dependencias..."
    npm install
fi

# Verificar puerto 3000
if ss -tuln | grep -q ":3000"; then
    echo " [AVISO] El puerto 3000 ya está en uso"
fi

echo ""
npm start

if [ $? -ne 0 ]; then
    echo ""
    echo " [ERROR] No se pudo iniciar el frontend"
fi

read -p "Presiona ENTER para salir..."
