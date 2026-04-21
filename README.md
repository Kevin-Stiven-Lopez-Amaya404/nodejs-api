# Node.js CRUD API 🚀

API REST completa con Node.js, Express y MySQL.

## Requisitos previos

- Node.js 20+
- MySQL 8.0+
- npm o yarn

## Instalación

```bash
# Clonar repositorio
git clone <tu-repo>
cd nodejs-api

# Instalar dependencias
npm install
```

## Configuración Local

```bash
# Copiar .env.example a .env
cp .env.example .env

# Editar .env con tus credenciales (si es necesario)
```

**Variables de entorno (.env):**
```
PORT=3000
NODE_ENV=development
DB_HOST=localhost
DB_PORT=3306
DB_USERNAME=root
DB_PASSWORD=root
DB_NAME=nodejs_crud
```

## Desarrollo

```bash
# Iniciar en modo desarrollo (con hot-reload)
npm run dev

# Iniciar en modo producción
npm start
```

La API estará disponible en `http://localhost:3000`

**Endpoints disponibles:**

| Método | Endpoint | Descripción |
|--------|----------|-------------|
| GET | `/` | Health check |
| POST | `/api/products` | Crear producto |
| GET | `/api/products` | Obtener todos los productos |
| GET | `/api/products/:id` | Obtener producto por ID |
| PUT | `/api/products/:id` | Actualizar producto |
| DELETE | `/api/products/:id` | Eliminar producto |
| POST | `/api/categories` | Crear categoría |
| GET | `/api/categories` | Obtener categorías |
| POST | `/api/orders` | Crear orden |
| GET | `/api/orders` | Obtener órdenes |

## Docker

```bash
# Construir imagen
docker build -t nodejs-api .

# Ejecutar contenedor
docker run -p 3000:3000 \
  -e DB_HOST=host.docker.internal \
  -e DB_USERNAME=root \
  -e DB_PASSWORD=root \
  nodejs-api
```

## CI/CD - Deploy a Railway

### Requisitos:

1. Cuenta en [Railway.app](https://railway.app)
2. Crear un proyecto en Railway
3. Conectar tu repositorio GitHub

### Variables de entorno en Railway:

```
PORT=3000
NODE_ENV=production
DB_HOST=<tu-railway-db-host>
DB_PORT=3306
DB_USERNAME=<tu-username>
DB_PASSWORD=<tu-password>
DB_NAME=nodejs_crud
```

### Secrets en GitHub:

En `Settings > Secrets and variables > Actions`, agregar:

- `RAILWAY_TOKEN`: Tu token de Railway
- `RAILWAY_SERVICE_NAME`: (Opcional) Nombre del servicio en Railway

El deploy se ejecutará automáticamente cuando hagas push a `main`.

## Estructura del Proyecto

```
nodejs-api/
├── src/
│   ├── app.js              # Punto de entrada
│   ├── config/
│   │   ├── db.js           # Conexión a BD
│   │   └── initDB.js       # Script de inicialización
│   ├── routes/             # Rutas de API
│   ├── controllers/        # Lógica de negocio
│   └── middlewares/        # Middlewares (si aplica)
├── .github/workflows/
│   └── deploy.yml          # Configuración CI/CD
├── .env                    # Variables de entorno (local)
├── .env.example            # Plantilla de .env
├── Dockerfile              # Configuración Docker
└── package.json            # Dependencias
```

## Troubleshooting

### Error de conexión a BD

```
Error: connect ECONNREFUSED 127.0.0.1:3306
```

**Soluciones:**
- Verificar que MySQL está corriendo: `mysql -u root -p`
- Revisar credenciales en `.env`
- Si usas Docker: usar `host.docker.internal` como DB_HOST

### Puerto 3000 ya en uso

```bash
# Ver qué está usando el puerto
lsof -i :3000

# O cambiar en .env
PORT=3001
```

### Error de dependencias

```bash
# Limpiar node_modules y reinstalar
rm -rf node_modules package-lock.json
npm install
```

## Desarrollo

```bash
# Iniciar con nodemon (auto-reload)
npm run dev

# Ver logs
npm start
```

## Notas Importantes ⚠️

- ✅ Base de datos se inicializa automáticamente al arrancar el servidor
- ✅ Validación de entrada con `express-validator`
- ✅ Health check endpoint disponible en `/`
- ✅ CI/CD automático con GitHub Actions
- ✅ Docker support incluido

## Contribuir

1. Crear rama: `git checkout -b feature/nueva-feature`
2. Commit: `git commit -m 'Agregar nueva-feature'`
3. Push: `git push origin feature/nueva-feature`
4. Pull Request: Crear PR en GitHub

## License

MIT
