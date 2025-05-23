import { prisma } from '../../utils/client.prima';

export const getAllRols = async () => prisma.rols.findMany();