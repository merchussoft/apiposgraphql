import { PrismaClient } from '@prisma/client';
import { LogsQueryModel } from '../schema-mongo';

const prisma = new PrismaClient({
  log: [{ emit: 'event', level: 'query' }]
});


prisma.$on('query', async (e) => {
    await LogsQueryModel.create({
        query: e.query,
        params: e.params,
        duration: e.duration
    });
})

export default prisma;