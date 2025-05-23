import prisma from "../../utils/client.prima";

export class CategoryModel {
    public prisma_client;

    constructor() {
        this.prisma_client = prisma;
    }

    async getAllCategories() {
        return await this.prisma_client.categorys.findMany();
    }

    async getCategory(cod_category: number) {
        return await this.prisma_client.categorys.findUnique({ where: { cod_category }})
    }

    async createCategorie(data: {name: string, active: boolean }) {
        return await this.prisma_client.categorys.create({ data })
    }

    async getSubcategoriesOfCategory(cod_category: number) {
        return await this.prisma_client.subcategorys.findMany({ where: { cod_category }});
    }
}