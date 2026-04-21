## 🔐 CÓMO AGREGAR RAILWAY_TOKEN A GITHUB

**Esto es necesario para que GitHub Actions haga deploy automático a Railway**

---

## PASO 1: Obtener tu Railway Token

### En tu navegador:
1. Ve a: **https://railway.app/account/tokens**
2. Click en **"Create New Token"**
3. Dale un nombre (ej: "GitHub Deploy")
4. Click **"Create"**
5. **Copia el token completo** (es una cadena larga)
6. **Guárdalo en lugar seguro** (no lo compartas)

---

## PASO 2: Agregar el Token a GitHub

### En GitHub:

1. Ve a tu repositorio: **https://github.com/Kevin-Stiven-Lopez-Amaya404/nodejs-api**

2. Click en **Settings** (arriba a la derecha)

3. En el menú izquierdo, ve a: **Secrets and variables → Actions**

4. Click en botón verde **"New repository secret"**

5. Completa:
   - **Name:** `RAILWAY_TOKEN`
   - **Secret:** Pega el token que copiaste de Railway

6. Click en **"Add secret"**

7. ¡Listo! Deberías ver tu secret listado

---

## PASO 3: Verificar que funciona

1. Haz cambios en tu código (o simplemente haz un commit vacío)

2. Haz push a `main`:
   ```powershell
   git add .
   git commit -m "Test deploy with RAILWAY_TOKEN"
   git push origin main
   ```

3. Ve a: **GitHub → Actions** (en tu repositorio)

4. Deberías ver el workflow ejecutándose:
   - ✅ Test
   - ✅ Build
   - ✅ Deploy a Railway

---

## 📋 Checklist

- [ ] Creé un token en railway.app/account/tokens
- [ ] Copié el token completo
- [ ] Fui a GitHub Settings > Secrets and variables > Actions
- [ ] Creé un nuevo secret llamado `RAILWAY_TOKEN`
- [ ] Pegué el token como valor del secret
- [ ] Hice un push a main
- [ ] Veo el workflow en GitHub Actions
- [ ] El deploy fue exitoso ✓

---

## 🚀 Después de agregar el token

El workflow hará automáticamente:

1. **Test** - Verifica que tu código funciona
2. **Build** - Prepara la aplicación  
3. **Deploy** - Sube a Railway automáticamente

Cada vez que hagas `git push origin main`, se ejecutará todo automáticamente.

---

## ⚠️ Importante

- **Nunca compartas tu RAILWAY_TOKEN** 
- Si accidentalmente lo compartiste, ve a Railway y regenera uno nuevo
- El token está encriptado en GitHub (no se ve el valor)

---

## 💡 Si algo falla

Revisa el workflow en **GitHub → Actions** y haz click en el run para ver los logs.

Típicamente falla por:
1. Token mal copiado
2. Token expirado
3. Tipo de token incorrecto

Si necesitas regenerar, simplemente repite los pasos 1-2.
