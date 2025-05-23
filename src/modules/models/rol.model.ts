import prisma from '../../utils/client.prima';

export class RolModel {

    static async getAll(): Promise<any[]> {
        return prisma.rols.findMany()
    }

    static async createRol(name: string) {
        return prisma.rols.create({data: {name}})
    }
}