import { SucursalModel } from "../../src/modules/models/Sucursal.model"


export default {
    Query: {
        getAllSucursal: async () => await SucursalModel.getAllSucursal()
    },
    Mutation: {
        createSucursal: async (_: any, args: {name: string, address: string, phone: string}) => await SucursalModel.createSucursal(args.name, args.address, args.phone)
    }
}