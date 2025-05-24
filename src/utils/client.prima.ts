import { PrismaClient } from '@prisma/client';
import { LogsQueryModel } from '../schema-mongo';

interface QueryEvent {
  query: string;
  params: string;
  duration: number;
  target: string;
}

const prisma = new PrismaClient({
  log: [{ emit: 'event', level: 'query' }]
});


prisma.$on('query', async (e: QueryEvent) => {
    await LogsQueryModel.create({
        query: e.query,
        params: e.params,
        duration: e.duration
    });
})

export default prisma;