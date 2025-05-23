import { Router } from "express";
import { RegisterUserController } from "../controllers";


const router = Router();


router.post('/registeruser/', RegisterUserController);


export default router;