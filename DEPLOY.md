# 🚀 Guía Completa de Deploy a Railway

## ⚠️ ANTES DE HACER PUSH A MAIN

### Paso 1: Instalar Railway CLI

```bash
npm install -g @railway/cli
```

### Paso 2: Vincular el repositorio a Railway

```bash
# Loguéate en Railway
railway login

# Desde la carpeta del proyecto, vincular
cd c:\Users\Stiven\Desktop\nodejs-api
railway link
```

Esto te pedirá:
- Seleccionar un proyecto existente O crear uno nuevo
- Listo, se creará un archivo `.railway` con la configuración

### Paso 3: Configurar variables de entorno en Railway

En el dashboard de Railway:
1. Ve a tu proyecto
2. Agrega estas variables:

```
PORT=3000
NODE_ENV=production
DB_HOST=<tu-database-url>
DB_PORT=3306
DB_USERNAME=<tu-usuario>
DB_PASSWORD=<tu-password>
DB_NAME=nodejs_crud
```

## 📝 Para GitHub Actions (CI/CD)

### Paso 1: Crear Secret en GitHub

1. Ve a tu repositorio en GitHub
2. Settings → Secrets and variables → Actions
3. Click "New repository secret"
4. Agrega:
   - **Nombre:** `RAILWAY_TOKEN`
   - **Valor:** Tu Railway API token (obtén uno en Railway dashboard → Account)

### Paso 2: Push a main

```bash
git add .
git commit -m "Setup deploy configuration"
git push origin main
```

El workflow se ejecutará automáticamente:
- ✅ Test (verifica código y BD)
- ✅ Build (prepara la aplicación)
- ✅ Deploy (envía a Railway)

---

## 🔧 Configuración Local (Desarrollo)

```bash
# Instalar dependencias
npm install

# Copiar variables de entorno
cp .env.example .env

# Editar .env con credenciales locales de BD
# nano .env

# Ejecutar en desarrollo
npm run dev
```

---

## ✅ Validación Final

### Verificar que todo está listo:

```bash
# 1. Railway CLI está instalado
railway --version

# 2. Proyecto está vinculado a Railway
railway status

# 3. Archivos necesarios existen
ls -la src/app.js
ls -la Dockerfile
ls -la .github/workflows/deploy.yml
ls -la railway.json

# 4. package.json tiene scripts
npm run dev    # ¿Funciona?
npm start      # ¿Funciona?
```

---

## 🐛 Troubleshooting

### "railway up" falla sin errores claros

```bash
# Ejecutar con más verbosidad
railway up --verbose
```

### "RAILWAY_TOKEN not found"

```bash
# Verificar que el token está configurado en GitHub
echo $RAILWAY_TOKEN

# Si está vacío, revisar Settings → Secrets
```

### Aplicación no inicia

```bash
# Revisar logs en Railway dashboard
# O localmente:
npm start
```

### Base de datos no se conecta

```bash
# Verificar que las variables están en Railway
# DB_HOST debe ser la URL de Railway, no localhost
```

---

## 🎯 Resumen de Pasos

```
1. railway login
2. railway link (desde la carpeta del proyecto)
3. Agregar RAILWAY_TOKEN a GitHub Secrets
4. Configurar variables de entorno en Railway dashboard
5. git push origin main
6. Verificar deploy en Railway dashboard
```

---

## 📊 Estructura Final

```
✅ Dockerfile - Multi-stage build optimizado
✅ .github/workflows/deploy.yml - CI/CD automatizado  
✅ railway.json - Configuración de Railway
✅ .env - Variables locales
✅ .env.example - Plantilla
✅ src/app.js - Inicia BD automáticamente
✅ package.json - Scripts funcionando
```

---

**¡Listo para hacer deploy! 🎉**
