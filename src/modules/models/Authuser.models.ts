import prisma from "../../utils/client.prima";
import { UserData } from "../../interfaces/user.interface";
import bcrypt from 'bcrypt';

export class AuthuserModel {

    public prisma_client;

    constructor() {
        this.prisma_client = prisma;
    }

    async login() {

    }

    async registerUser(data: UserData) {

        const hashed_password = await bcrypt.hash(data.password, 10);
        data.password = hashed_password;

        return await this.prisma_client.users.create({ data })
    }

}