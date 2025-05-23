/*
  Warnings:

  - You are about to drop the column `sucursalsCod_sucursal` on the `users` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_sucursalsCod_sucursal_fkey";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "sucursalsCod_sucursal";
