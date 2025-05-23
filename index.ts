import 'dotenv/config';
import app from './src/app';
import { createApolloServer } from './graphql';


createApolloServer(app);