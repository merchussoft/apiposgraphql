import express from 'express';
import cors from 'cors';
import morgan from 'morgan';

//import { contextMiddleware } from './middlewares/context.middleware';

import rolRoutes from './modules/routes/rol.routes';
import sucursalRoutes from './modules/routes/sucursal.route';
import authRoutes from './modules/routes/login.routes';


const app = express();

// Settings
app.set('port', process.env.PORT || 3000);


// Middlewares
app.use(cors({
    origin: "*"
}));
app.use(morgan('dev'))
app.use(express.urlencoded({ extended: true }));
app.use(express.json());
//app.use(contextMiddleware)


//Routes
app.use('/api/rols', rolRoutes);
app.use('/api/sucursals', sucursalRoutes);
app.use('/api/auth', authRoutes);

export default app;