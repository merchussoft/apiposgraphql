import { Request, Response } from "express";
import { SucursalModel } from '../models';
import { logsErrors } from '../../utils/logger';


export const getAllSucursal = async (_req: Request, res: Response) => {

    try {
        const sucursals = await SucursalModel.getAllSucursal();

       
        
        res.status(200).json(sucursals);

    } catch (err) {
        await logsErrors('info', 'error de la creacion de surcusal', 'getAllSucursal', {data: err})
        res.status(403).json({ message: 'Error al crear la sucursal'})
    }
}