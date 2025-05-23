/*
  Warnings:

  - You are about to drop the `subcategory` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "subcategory" DROP CONSTRAINT "subcategory_cod_category_fkey";

-- DropTable
DROP TABLE "subcategory";

-- CreateTable
CREATE TABLE "subcategorys" (
    "cod_subcategory" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "cod_category" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "subcategorys_pkey" PRIMARY KEY ("cod_subcategory")
);

-- CreateIndex
CREATE UNIQUE INDEX "subcategorys_name_cod_category_key" ON "subcategorys"("name", "cod_category");

-- AddForeignKey
ALTER TABLE "subcategorys" ADD CONSTRAINT "subcategorys_cod_category_fkey" FOREIGN KEY ("cod_category") REFERENCES "categorys"("cod_category") ON DELETE RESTRICT ON UPDATE CASCADE;
