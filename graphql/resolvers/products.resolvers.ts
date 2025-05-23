import { ProductsModel } from '../../src/modules/models/Products.models';
import { CategoryModel } from '../../src/modules/models/Category.models';

const product_model = new ProductsModel();
const category_model = new CategoryModel();

export default {
    Query: {
        getAllProducts: async () => {
            const products = await product_model.getAllProducts();
            return products.map(product => {
                return {
                    ...product,
                    images: product.images || []
                }
            }) 
        },
        getProduct: async (_: any, { cod_product }: { cod_product: number }) => await product_model.getProduct(cod_product)
    },
    Mutation: {
        createProduct: async (_: any, { data }: any) => await product_model.createProduct(data),
        deleteProduct: async (_: any, { cod_product }: { cod_product: number }) => await product_model.deleteProduct(cod_product)
    },
    Products: {
        category: async ( parent: any ) => await category_model.getCategory(parent.cod_category)
    }
}