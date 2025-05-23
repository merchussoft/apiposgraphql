import { Router } from "express";
import { getAll } from "../controllers";


const router = Router();

router.get('/', getAll);


export default router;