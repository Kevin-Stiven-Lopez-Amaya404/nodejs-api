require('dotenv').config();
const express = require('express');
const initDB = require('./config/initDB');
const app = express();

app.use(express.json());

// ── Routes ──────────────────────────────────────────────
app.use('/api/products',   require('./routes/productRoutes'));
app.use('/api/categories', require('./routes/categoryRoutes'));
app.use('/api/orders',     require('./routes/orderRoutes'));

// ── Health check ────────────────────────────────────────
app.get('/', (_req, res) => res.json({ status: 'OK', message: 'API Node.js corriendo' }));

// ── Global error handler ────────────────────────────────
app.use((err, _req, res, _next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Error interno del servidor' });
});

const PORT = process.env.PORT || 3000;
let dbInitialized = false;

// ── Initialize DB on first request ──────────────────────
const ensureDBInit = async () => {
  if (!dbInitialized) {
    try {
      console.log('Inicializando base de datos...');
      await initDB();
      console.log('✓ Base de datos inicializada correctamente');
      dbInitialized = true;
    } catch (error) {
      console.warn('⚠️ Base de datos no disponible aún:', error.message);
      setTimeout(ensureDBInit, 5000); // Reintentar en 5 segundos
    }
  }
};

// ── Start server ────────────────────────────────────────
const startServer = () => {
  app.listen(PORT, () => {
    console.log(`✓ Servidor corriendo en el puerto ${PORT}`);
    console.log(`✓ Ambiente: ${process.env.NODE_ENV || 'development'}`);
    // Iniciar BD en background (no bloquea el servidor)
    ensureDBInit().catch(err => console.warn('Error en inicialización de BD:', err));
  });
};

startServer();
