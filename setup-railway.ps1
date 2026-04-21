# Setup Railway - PowerShell Script (Para Windows)
# Ejecutar: powershell -ExecutionPolicy Bypass -File setup-railway.ps1

Write-Host "🚀 SETUP RAILWAY - Node.js API" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# 1. Verificar Node.js
Write-Host "1️⃣ Verificando Node.js..." -ForegroundColor Yellow
$node = Get-Command node -ErrorAction SilentlyContinue
if (-not $node) {
    Write-Host "❌ Node.js no está instalado" -ForegroundColor Red
    exit 1
}
$nodeVersion = node --version
Write-Host "✅ Node.js $nodeVersion" -ForegroundColor Green
Write-Host ""

# 2. Verificar/Instalar Railway CLI
Write-Host "2️⃣ Verificando Railway CLI..." -ForegroundColor Yellow
$railway = Get-Command railway -ErrorAction SilentlyContinue
if (-not $railway) {
    Write-Host "⚠️ Railway CLI no está instalado" -ForegroundColor Yellow
    Write-Host "Instalando..." -ForegroundColor Yellow
    npm install -g @railway/cli
}
$railwayVersion = railway --version
Write-Host "✅ Railway CLI $railwayVersion" -ForegroundColor Green
Write-Host ""

# 3. Logueo Railway
Write-Host "3️⃣ Logueo en Railway..." -ForegroundColor Yellow
Write-Host "Se abrirá el navegador para que hagas login" -ForegroundColor Cyan
railway login
Write-Host "✅ Login completado" -ForegroundColor Green
Write-Host ""

# 4. Vincular proyecto
Write-Host "4️⃣ Vinculando proyecto a Railway..." -ForegroundColor Yellow
$confirm = Read-Host "¿Deseas vincular este proyecto? (s/n)"
if ($confirm -eq "s" -or $confirm -eq "S") {
    railway link
    Write-Host "✅ Proyecto vinculado" -ForegroundColor Green
} else {
    Write-Host "⏭️ Saltando vinculación" -ForegroundColor Yellow
}
Write-Host ""

# 5. Ver status
Write-Host "5️⃣ Estado actual del proyecto:" -ForegroundColor Yellow
railway status
Write-Host ""

# 6. Opción: Agregar BD
Write-Host "6️⃣ ¿Agregar base de datos?" -ForegroundColor Yellow
$addDb = Read-Host "¿Deseas agregar MySQL? (s/n)"
if ($addDb -eq "s" -or $addDb -eq "S") {
    railway add
    Write-Host "✅ BD agregada" -ForegroundColor Green
} else {
    Write-Host "⏭️ Saltando BD" -ForegroundColor Yellow
}
Write-Host ""

# 7. Información final
Write-Host "================================" -ForegroundColor Cyan
Write-Host "✅ SETUP INICIAL COMPLETADO!" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 Próximos pasos:" -ForegroundColor Cyan
Write-Host "1. Configura variables de entorno en Railway dashboard:" -ForegroundColor White
Write-Host "   - https://railway.app" -ForegroundColor Cyan
Write-Host "   - Variables necesarias:" -ForegroundColor White
Write-Host "     * DB_HOST (URL de tu BD)" -ForegroundColor Gray
Write-Host "     * DB_USERNAME" -ForegroundColor Gray
Write-Host "     * DB_PASSWORD" -ForegroundColor Gray
Write-Host "     * DB_NAME=nodejs_crud" -ForegroundColor Gray
Write-Host "     * PORT=3000" -ForegroundColor Gray
Write-Host "     * NODE_ENV=production" -ForegroundColor Gray
Write-Host ""
Write-Host "2. Haz deploy:" -ForegroundColor White
Write-Host "   railway up" -ForegroundColor Cyan
Write-Host ""
Write-Host "3. O para CI/CD automático en GitHub:" -ForegroundColor White
Write-Host "   a) Ve a: https://railway.app/account/tokens" -ForegroundColor Cyan
Write-Host "   b) Copia tu token" -ForegroundColor Cyan
Write-Host "   c) En GitHub Settings > Secrets > RAILWAY_TOKEN" -ForegroundColor Cyan
Write-Host "   d) git push origin main" -ForegroundColor Cyan
Write-Host ""
Write-Host "📚 Ver más info en: RAILWAY_GUIDE.md" -ForegroundColor Cyan
Write-Host ""
