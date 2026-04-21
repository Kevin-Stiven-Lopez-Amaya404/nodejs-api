## 🚀 CONFIGURACIÓN DE RAILWAY - PASOS FINALES

### ✅ LO QUE YA HEMOS HECHO

1. ✅ Instalado Railway CLI (v4.40.0)
2. ✅ Loguado en Railway como: **Kevin Stiven Lopez Amaya (mrroobot08@gmail.com)**
3. ✅ Vinculado proyecto a: **romantic-healing** (production)
4. ✅ Seleccionado BD: **MySQL**

---

## 📋 PRÓXIMOS PASOS

### PASO 1: Obtener credenciales de MySQL

1. Ve a **https://railway.app**
2. Selecciona proyecto **romantic-healing**
3. Haz click en el servicio **MySQL**
4. Tab **"Connect"**
5. Copia la URL de conexión o las credenciales individuales

Ejemplo de credenciales que verás:
```
Host: railway.app
Port: XXXXX
Username: root
Password: xxxxxxxxxx
Database: railway (o lo que configuraste)
```

---

### PASO 2: Configurar variables de entorno en tu App

1. Ve a **https://railway.app**
2. Selecciona proyecto **romantic-healing**
3. Busca y haz click en **"nodejs-api"** (o tu servicio de app)
4. Tab **"Variables"**
5. Agrega estas variables:

```
PORT=3000
NODE_ENV=production
DB_HOST=<Host de MySQL>
DB_PORT=<Puerto de MySQL>
DB_USERNAME=root
DB_PASSWORD=<Tu password de MySQL>
DB_NAME=railway
```

---

### PASO 3: Deploy de la Aplicación

Una vez configuradas las variables, ejecuta desde tu máquina:

```powershell
railway up
```

Esto:
- Construye tu aplicación
- La sube a Railway
- La inicia automáticamente

**Espera a que termine y obtendrás una URL pública** ✅

---

### PASO 4: Verificar que está funcionando

```powershell
# Ver logs en tiempo real
railway logs --follow

# Ver estado
railway status

# Abrir dashboard
railway open
```

---

## 🔐 Para GitHub Actions (CI/CD Automático)

Si quieres que se deploy automáticamente cuando hagas `git push main`:

### Paso 1: Obtener Railway Token

1. Ve a **https://railway.app/account/tokens**
2. Click **"Create New Token"**
3. Copia el token

### Paso 2: Agregar a GitHub

1. Ve a tu repositorio GitHub
2. **Settings → Secrets and variables → Actions**
3. Click **"New repository secret"**
4. **Nombre:** `RAILWAY_TOKEN`
5. **Valor:** Pega tu token aquí

### Paso 3: Push a main

```powershell
git add .
git commit -m "App ready for deploy"
git push origin main
```

**GitHub Actions ejecutará automáticamente:**
- ✅ Tests
- ✅ Build
- ✅ Deploy a Railway

---

## 📊 ESTADO ACTUAL

```
✅ Railway CLI: v4.40.0
✅ Usuario: Kevin Stiven Lopez Amaya
✅ Proyecto: romantic-healing
✅ Ambiente: production
✅ BD: MySQL
✅ Archivo .railway: Creado (guarda configuración local)
```

---

## 📝 CHECKLIST FINAL

- [ ] Obtuviste credenciales de MySQL de Railway
- [ ] Configuraste variables en Railway dashboard
- [ ] Ejecutaste: `railway up`
- [ ] Verificaste logs: `railway logs --follow`
- [ ] (Opcional) Agregaste RAILWAY_TOKEN a GitHub
- [ ] (Opcional) Hiciste push a main

---

## 🎯 PRÓXIMO COMANDO A EJECUTAR

```powershell
railway up
```

**Esto hará el deploy a Railway** 🚀

---

## 💡 TIPS

- **railway logs --follow** = Ver lo que está pasando en tiempo real
- **railway status** = Ver estado actual
- **railway open** = Abrir dashboard en el navegador
- **railway env** = Ver variables configuradas
- **railway env set KEY=value** = Cambiar variable desde terminal

---

**¿Listo para hacer `railway up`? ¡Vamos!**
