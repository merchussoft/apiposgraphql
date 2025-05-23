import prisma from "../../utils/client.prima";

export class SubcategoryModels {
    public prisma_client;

    constructor() {
        this.prisma_client = prisma;
    }

    async getAllSubcategories() {
        return await this.prisma_client.subcategorys.findMany();
    }

    async getSubcategory(cod_subcategory: number) {
        return await this.prisma_client.subcategorys.findUnique({ where: { cod_subcategory }})
    }

    async createSubcategorie(data: {name: string, description: string, cod_category: number }) {
        return await this.prisma_client.subcategorys.create({ data })
    }
}