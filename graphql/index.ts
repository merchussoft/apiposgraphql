import { ApolloServer } from "@apollo/server";
import { expressMiddleware } from '@apollo/server/express4';
import { makeExecutableSchema } from '@graphql-tools/schema';
import { ApolloServerPluginDrainHttpServer } from "@apollo/server/plugin/drainHttpServer";

import express from "express";
import http from 'http';
import cors from 'cors';
import { connectMongo } from '../src/utils/mongo';


import { typeDefs } from './schemaLoader';
import { resolvers } from './resolverLoader';


export const createApolloServer = async (app: express.Express) => {
    await connectMongo();

    const httpServer = http.createServer(app);

    const schema = makeExecutableSchema({ typeDefs, resolvers})

    const server = new ApolloServer({
        schema,
        plugins: [ApolloServerPluginDrainHttpServer({ httpServer })],
        csrfPrevention: false
    });

    await server.start();
    
    app.use(
        '/graphql',
        cors<cors.CorsRequest>(),
        express.json(),
        expressMiddleware(server)
    )

    httpServer.listen({port: app.get('port'), host: '0.0.0.0' }, () => {
        console.log(`🚀 REST on http://localhost:${app.get('port')}`);
        console.log(`🚀 GraphQL on http://localhost:${app.get('port')}/graphql`);
    })
}