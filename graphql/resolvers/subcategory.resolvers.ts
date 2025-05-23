import { SubcategoryModels } from "../../src/modules/models/Subcategory.models";

const subca_model =  new SubcategoryModels();

export default {
    Query: {
        getAllSubcategories: async () => await subca_model.getAllSubcategories(),
        getSubcategory: async (_: any, { cod_subcategory }: { cod_subcategory: number }) => await subca_model.getSubcategory(cod_subcategory)
    },
    Mutation: {
        createSubcategorie: async (_: any, { data }: { data: { name: string, description: string, cod_category: number }}) => await subca_model.createSubcategorie(data)
    },
    Subcategory: {
        category: async ( parent: any ) => await subca_model.prisma_client.categorys.findUnique({ where: { cod_category: parent.cod_category }})
    }
}