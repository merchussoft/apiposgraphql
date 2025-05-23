import prisma from '../../utils/client.prima';

export class SucursalModel {

    static async getAllSucursal(): Promise<any[]> {
        return prisma.sucursals.findMany()
    }

    static async createSucursal(name: string, address: string, phone: string) {
        return prisma.sucursals.create({data: {name, address, phone}})
    }
}