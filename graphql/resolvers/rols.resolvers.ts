import { RolModel } from "../../src/modules/models/rol.model";

export default {
    Query: {
        getAllRols: async () => await RolModel.getAll()
    },
    Mutation: {
        createRol: async (_: any, args: {name: string}) => await RolModel.createRol(args.name)
    }
}