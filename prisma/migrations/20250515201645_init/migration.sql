/*
  Warnings:

  - You are about to alter the column `name` on the `subcategorys` table. The data in that column could be lost. The data in that column will be cast from `Text` to `VarChar(100)`.

*/
-- AlterTable
ALTER TABLE "subcategorys" ALTER COLUMN "name" SET DATA TYPE VARCHAR(100);
