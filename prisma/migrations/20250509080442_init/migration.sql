/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `sucursals` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `name` to the `sucursals` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "sucursals" ADD COLUMN     "active" BOOLEAN NOT NULL DEFAULT true,
ADD COLUMN     "address" TEXT,
ADD COLUMN     "name" VARCHAR(100) NOT NULL,
ADD COLUMN     "phone" VARCHAR(20);

-- CreateIndex
CREATE UNIQUE INDEX "sucursals_name_key" ON "sucursals"("name");

-- CreateIndex
CREATE INDEX "sucursals_name_idx" ON "sucursals"("name");
