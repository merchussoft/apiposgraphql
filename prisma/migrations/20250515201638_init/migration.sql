/*
  Warnings:

  - A unique constraint covering the columns `[name]` on the table `subcategorys` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "subcategorys_name_key" ON "subcategorys"("name");
