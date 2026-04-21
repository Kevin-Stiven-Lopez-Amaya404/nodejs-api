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

// ── Start server with DB initialization ──────────────
const startServer = async () => {
  try {
    console.log('Inicializando base de datos...');
    await initDB();
    console.log('Base de datos inicializada correctamente');
    app.listen(PORT, () => console.log(`Servidor corriendo en el puerto ${PORT}`));
  } catch (error) {
    console.error('Error al iniciar el servidor:', error);
    process.exit(1);
  }
};

startServer();
