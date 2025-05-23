import { Router } from "express";
import { getAllSucursal } from "../controllers";


const router = Router();

router.get('/', getAllSucursal);


export default router;