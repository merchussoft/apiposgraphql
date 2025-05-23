import prisma from '../../utils/client.prima';


export class ProductsModel {

     public prisma_client;

    constructor() {
        this.prisma_client = prisma;
    }

    async getAllProducts(): Promise<any[]> {
        return await prisma.products.findMany({
            include: {
                images: true
            }
        });
    }

    async getProduct(cod_product: number) {
        return await prisma.products.findUnique({ where: { cod_product }})
    }

    async createProduct(data: any) {
        return await prisma.products.create({ data });
    }

    async deleteProduct(cod_product: number) {
        return await prisma.products.delete({ where: { cod_product }});
    }
}