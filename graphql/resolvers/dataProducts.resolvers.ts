import productsResolvers from "./products.resolvers";
import categoryResolvers from "./category.resolvers";
import subcategoryResolvers from "./subcategory.resolvers";


export default {
    Query: {
        ...productsResolvers.Query
    },
    Products: {
        ...productsResolvers.Products
    },
    Category: {
        ...categoryResolvers.Category
    },
    Subcategory: {
        ...subcategoryResolvers.Subcategory
    }
}