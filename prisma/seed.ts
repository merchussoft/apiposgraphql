import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
    
    const roles = [
        {name: "super_admin"},
        {name: "admin"},
        {name: "auxiliar"}
    ];

    // se usa upsert para evitar duplicados
    for(const rol of roles) {
        await prisma.rols.upsert({
            where: { name: rol.name },
            update: {},
            create: rol
        });
    }

    console.log('Datos predeterminados insertados o verificados')
}

main()
.catch(e => {
    throw e
})
.finally(async () => {
    await prisma.$disconnect();
})