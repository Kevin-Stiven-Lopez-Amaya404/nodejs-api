## 🚀 GUÍA PRÁCTICA: CÓMO TRABAJAR CON RAILWAY

---

## 1️⃣ INSTALACIÓN INICIAL (UNA SOLA VEZ)

### Instalar Railway CLI

```bash
npm install -g @railway/cli
```

Verificar que está instalado:
```bash
railway --version
```

---

## 2️⃣ LOGUEO EN RAILWAY

```bash
railway login
```

Esto abrirá el navegador para que hagas login en Railway.app

Después de loguear, vuelve a la terminal y presiona Enter.

---

## 3️⃣ VINCULAR TU PROYECTO A RAILWAY

**ESTO ES IMPORTANTE - SOLO UNA VEZ POR PROYECTO**

```bash
cd c:\Users\Stiven\Desktop\nodejs-api
railway link
```

Te pedirá elegir:
- **Crear un nuevo proyecto?** → Selecciona `Yes` / Ingresa nombre
- **O usar uno existente?** → Si ya tienes un proyecto en Railway

Esto crea una carpeta `.railway` con la configuración.

---

## 4️⃣ AGREGAR BASE DE DATOS EN RAILWAY

### Opción A: Desde Railway CLI

```bash
railway add
```

Selecciona:
- `MySQL` o `PostgreSQL`
- Esto creará automáticamente la BD en Railway

### Opción B: Desde el Dashboard

1. Ve a https://railway.app
2. Selecciona tu proyecto
3. Click en "+ New"
4. Selecciona "Database" → "MySQL"

---

## 5️⃣ CONFIGURAR VARIABLES DE ENTORNO

### Desde Railway Dashboard

1. Ve a https://railway.app
2. Selecciona tu proyecto
3. Click en tu servicio (la app)
4. Tab "Variables"
5. Agrega:

```
PORT=3000
NODE_ENV=production
DB_HOST=<la-url-que-railway-te-proporcione>
DB_PORT=3306
DB_USERNAME=<tu-usuario-railroad>
DB_PASSWORD=<tu-password-railroad>
DB_NAME=nodejs_crud
```

**Para obtener credenciales de BD:**
- Ve a tu BD en Railway
- Tab "Connect"
- Copia la URL o credenciales

---

## 6️⃣ DEPLOY LOCAL (PRUEBA)

```bash
# Desde tu máquina, deploy a Railway
railway up
```

Esto:
- Construye la aplicación
- Envía a Railway
- Inicia el servidor

---

## 7️⃣ VER LOGS

### En tiempo real:

```bash
railway logs --follow
```

### Histórico:

```bash
railway logs
```

---

## 8️⃣ ESTADO DEL PROYECTO

```bash
railway status
```

Muestra:
- Servicios activos
- URLs públicas
- Variables de entorno

---

## 9️⃣ ABRIR DASHBOARD

```bash
railway open
```

Abre automáticamente tu proyecto en railway.app

---

## 🔟 PARA GITHUB ACTIONS (CI/CD)

### Paso 1: Obtener tu Railway API Token

1. Ve a https://railway.app/account/tokens
2. Click "Create New Token"
3. Copia el token

### Paso 2: Agregar Secret a GitHub

```
Ir a: Settings → Secrets and variables → Actions
Click: "New repository secret"

Nombre: RAILWAY_TOKEN
Valor: <pega-tu-token-aquí>
```

### Paso 3: Push a Main

```bash
git add .
git commit -m "Setup ready for deploy"
git push origin main
```

El workflow se ejecutará automáticamente ✅

---

## 📊 FLUJO TÍPICO DE TRABAJO

### Para desarrollo local:

```bash
# 1. Cambios en código
code src/app.js

# 2. Probar localmente
npm run dev

# 3. Subir a GitHub
git add .
git commit -m "Feature X"
git push origin main

# El CI/CD automáticamente:
# → Prueba código
# → Deploy a Railway
```

### Para deploy manual:

```bash
# 1. Haces cambios
# 2. railway up (desde tu máquina)
# 3. Listo en Railway
```

---

## 🐛 COMANDOS ÚTILES

| Comando | Qué hace |
|---------|----------|
| `railway login` | Loguear en Railway |
| `railway link` | Vincular proyecto actual |
| `railway up` | Deploy de la aplicación |
| `railway logs` | Ver logs |
| `railway logs --follow` | Ver logs en tiempo real |
| `railway status` | Ver estado del proyecto |
| `railway open` | Abrir dashboard |
| `railway add` | Agregar servicio (BD, Redis, etc) |
| `railway remove` | Eliminar servicio |
| `railway env` | Ver variables de entorno |
| `railway env set KEY=value` | Establecer variable |

---

## ✅ CHECKLIST FINAL

- [ ] Railway CLI instalado (`railway --version`)
- [ ] Loguedo en Railway (`railway login`)
- [ ] Proyecto vinculado (`railway link`)
- [ ] BD configurada (MySQL en Railway)
- [ ] Variables de entorno configuradas
- [ ] `.github/workflows/deploy.yml` actualizado
- [ ] `railway.json` en el proyecto
- [ ] RAILWAY_TOKEN en GitHub Secrets
- [ ] `package.json` con scripts `start` y `dev`
- [ ] `Dockerfile` presente
- [ ] `.env` local para desarrollo

---

## 🎯 PRÓXIMOS PASOS

1. **Haz login en Railway:**
   ```bash
   railway login
   ```

2. **Vincula tu proyecto:**
   ```bash
   cd c:\Users\Stiven\Desktop\nodejs-api
   railway link
   ```

3. **Agrégale BD:**
   ```bash
   railway add
   ```

4. **Deploy de prueba:**
   ```bash
   railway up
   ```

5. **Configura secrets en GitHub** (ya explicado arriba)

6. **Push a main** y ¡listo! 🚀

---

## 💡 TIPS IMPORTANTES

- ✅ **BD_HOST en Railway:** No es `localhost`, es la URL que Railway te da
- ✅ **Variables de entorno:** Configúralas en Railway dashboard, no en `.env`
- ✅ **Logs:** Revisa siempre los logs si algo falla
- ✅ **Deploy manual:** `railway up` despliega lo que tienes localmente
- ✅ **Deploy automático:** GitHub Actions lo hace cuando haces push a `main`
- ✅ **Health check:** Tu app debe responder en `/` con status 200

---

**¿Necesitas ayuda en algún paso específico?**
