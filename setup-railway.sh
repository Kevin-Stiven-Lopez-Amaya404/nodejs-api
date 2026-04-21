#!/bin/bash
# Script de Setup para Railway
# Ejecutar: bash setup-railway.sh

echo "🚀 SETUP RAILWAY - Node.js API"
echo "================================"
echo ""

# 1. Verificar Node.js
echo "1️⃣ Verificando Node.js..."
if ! command -v node &> /dev/null; then
    echo "❌ Node.js no está instalado"
    exit 1
fi
echo "✅ Node.js $(node --version)"
echo ""

# 2. Verificar Railway CLI
echo "2️⃣ Verificando Railway CLI..."
if ! command -v railway &> /dev/null; then
    echo "⚠️ Railway CLI no está instalado"
    echo "Instalando..."
    npm install -g @railway/cli
fi
echo "✅ Railway CLI $(railway --version)"
echo ""

# 3. Logueo Railway
echo "3️⃣ Logueo en Railway..."
echo "Se abrirá el navegador para que hagas login"
railway login
echo "✅ Login completado"
echo ""

# 4. Vincular proyecto
echo "4️⃣ Vinculando proyecto..."
railway link
echo "✅ Proyecto vinculado"
echo ""

# 5. Agregar BD
echo "5️⃣ ¿Agregar base de datos?"
read -p "¿Deseas agregar MySQL? (y/n) " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    railway add
    echo "✅ BD agregada"
else
    echo "⏭️ Saltando BD"
fi
echo ""

# 6. Ver status
echo "6️⃣ Estado del proyecto:"
railway status
echo ""

# 7. Variables de entorno
echo "7️⃣ Configurar variables de entorno"
echo "Ve a: https://railway.app y configura:"
echo "  - DB_HOST (URL de tu BD)"
echo "  - DB_USERNAME"
echo "  - DB_PASSWORD"
echo "  - DB_NAME=nodejs_crud"
echo "  - PORT=3000"
echo "  - NODE_ENV=production"
echo ""

echo "✅ SETUP COMPLETADO!"
echo ""
echo "Próximos pasos:"
echo "1. Configura variables de entorno en Railway dashboard"
echo "2. railway up (para hacer deploy)"
echo "3. O agrega RAILWAY_TOKEN a GitHub para CI/CD"
echo ""
echo "Ver más info en: RAILWAY_GUIDE.md"
