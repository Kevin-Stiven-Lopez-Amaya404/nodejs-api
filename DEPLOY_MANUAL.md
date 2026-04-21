## 🚀 DEPLOY MANUAL A RAILWAY - GUÍA FINAL

Tu proyecto está completamente listo para hacer deploys manuales con `railway up`.

---

## ✅ LO QUE TIENES CONFIGURADO

```
Proyecto Railway: romantic-healing
├── nodejs-api (CORRIENDO)
│   └── Puerto: 8080
└── MySQL (CORRIENDO)
    └── Puerto: 3306
    └── Credenciales guardadas
```

**Endpoints disponibles:**
- `GET /` - Health check
- `GET/POST /api/products` - Productos
- `GET/POST /api/categories` - Categorías  
- `GET/POST /api/orders` - Órdenes

---

## 🔄 FLUJO DE TRABAJO PARA FUTUROS CAMBIOS

### 1. Haces cambios en tu código
```powershell
code src/app.js
```

### 2. Pruebas localmente
```powershell
npm run dev
```

### 3. Subes cambios a GitHub
```powershell
git add .
git commit -m "Tu mensaje de cambios"
git push origin main
```

### 4. Haces deploy a Railway
```powershell
railway up
```

---

## 📊 COMANDOS RAILWAY ÚTILES

```powershell
# Ver estado actual
railway status

# Ver logs en tiempo real
railway logs --follow

# Abrir dashboard en navegador
railway open

# Ver variables configuradas
railway variables

# Ver URL pública
railway status  # Mira "Available at"

# Cambiar de servicio
railway service

# Más información
railway --help
```

---

## 🔧 SI NECESITAS CONFIGURAR VARIABLES

Para agregar o cambiar variables de entorno:

**Opción 1: Desde Dashboard (Recomendado)**
1. Ve a https://railway.app
2. Selecciona proyecto: romantic-healing
3. Selecciona servicio: nodejs-api
4. Tab "Variables"
5. Agrega/edita variables
6. La app se reinicia automáticamente

**Opción 2: Desde terminal**
```powershell
railway service  # Selecciona nodejs-api
railway variables  # Ve las actuales
railway env set KEY=value  # Cambia una variable
```

---

## 📝 CHECKLIST PARA PRÓXIMO DEPLOY

Antes de hacer `railway up`:

- [ ] Hice cambios en el código
- [ ] Probé localmente: `npm run dev`
- [ ] Todo funciona correctamente
- [ ] Hice commit: `git add . && git commit -m "..."`
- [ ] Hice push: `git push origin main`
- [ ] Estoy en la rama main: `git branch`
- [ ] Los cambios están en GitHub

Luego:
```powershell
railway up
```

---

## 🚀 PRÓXIMA VEZ QUE HAGAS DEPLOY

```powershell
# 1. Ve a tu proyecto
cd c:\Users\Stiven\Desktop\nodejs-api

# 2. Verifica que estás loguado
railway status

# 3. Haz el deploy
railway up

# 4. Ve los logs mientras se despliega
railway logs --follow
```

---

## 💾 ARCHIVOS IMPORTANTES

| Archivo | Propósito |
|---------|-----------|
| `src/app.js` | Punto de entrada de la app |
| `Dockerfile` | Configuración Docker (multi-stage) |
| `.github/workflows/deploy.yml` | CI/CD workflow (no usado por ahora) |
| `railway.json` | Configuración de Railway |
| `.env` | Variables locales |
| `package.json` | Dependencias y scripts |

---

## 🔐 CREDENCIALES GUARDADAS

**MySQL:**
- Host: `mysql.railway.internal`
- Port: `3306`
- Username: `root`
- Password: `KpYsABbaGiwgBvHEKxEHYwjGIsNYOGZK`
- Database: `railway`

Estas están ya configuradas en Railway como variables de entorno.

---

## 📋 RESUMEN FINAL

✅ **Tienes:**
- API Node.js deployada en Railway
- Base de datos MySQL en Railway
- Dockerfile optimizado
- GitHub Actions workflow listo
- Todo el código en GitHub
- Credenciales configuradas

✅ **Puedes:**
- Hacer cambios locales
- Probar con `npm run dev`
- Subir a GitHub
- Desplegar a Railway con `railway up`
- Ver logs con `railway logs --follow`

✅ **Próximos pasos:**
1. Haz cambios en tu código
2. `npm run dev` para probar
3. `git push origin main`
4. `railway up` para desplegar

---

## 🆘 SI ALGO FALLA

**Si `railway up` falla:**
```powershell
# Ver más detalles
railway logs --follow

# Revisar si estás loguado
railway status

# Cambiar de servicio
railway service
```

**Si la app no conecta a la BD:**
```powershell
# Ver variables
railway variables

# Verifica que estén:
# - DB_HOST=mysql.railway.internal
# - DB_PASSWORD=KpYsABbaGiwgBvHEKxEHYwjGIsNYOGZK
# - etc.
```

---

## 🎯 TODO LISTO PARA PRODUCCIÓN

Tu API está lista para:
- ✅ Desarrollo local
- ✅ Deploy manual a Railway
- ✅ Deploy automático en el futuro (si agregas RAILWAY_TOKEN)
- ✅ Escalabilidad
- ✅ Múltiples ambientes

**¡Éxito con tu proyecto! 🚀**
