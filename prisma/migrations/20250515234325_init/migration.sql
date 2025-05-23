/*
  Warnings:

  - You are about to drop the column `cod_sucursal` on the `users` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_cod_sucursal_fkey";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "cod_sucursal",
ADD COLUMN     "sucursalsCod_sucursal" INTEGER;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_sucursalsCod_sucursal_fkey" FOREIGN KEY ("sucursalsCod_sucursal") REFERENCES "sucursals"("cod_sucursal") ON DELETE SET NULL ON UPDATE CASCADE;
