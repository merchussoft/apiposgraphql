import { CategoryModel } from "../../src/modules/models/Category.models";

const category = new CategoryModel();

export default {
    Query: {
        getAllCategories: async () => await category.getAllCategories(),
        getCategory: async (_: any, { cod_category }: { cod_category: number}) => await category.getCategory(cod_category)
    },
    Mutation: {
        createCategorie: async (_: any, { data }: { data: {name: string, active: boolean } }) => await  category.createCategorie(data)
    },
    Category: {
        subcategories: async (parent: any) => await category.getSubcategoriesOfCategory(parent.cod_category)
    }
}