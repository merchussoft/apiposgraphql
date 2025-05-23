import { Request, Response } from "express";
import { RolModel } from '../models';


export const getAll = async (_req: Request, res: Response) => {
    const rols = await RolModel.getAll();
    res.json(rols);
}