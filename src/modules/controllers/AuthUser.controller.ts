import { Request, Response } from "express";
import { AuthuserModel } from "../models/Authuser.models";
import { UserData } from "../../interfaces/user.interface";

const auth_model = new AuthuserModel();

export const RegisterUserController = async (_req: Request, res: Response) => {
    try {
        const data_body: UserData = _req.body;
        await auth_model.registerUser(data_body);

        res.status(200).json({ data: { message: `El usuario ${data_body.name} se ah creado correctamente`, type: 'success' }});
        
    } catch (err) {
        console.log('Error al intenter registrar el usuario: ', err);
        res.status(403).json({ data: { message: 'Usuario no registrado', type: 'error' }});
    }
}