-- AlterTable
ALTER TABLE "categorys" ADD COLUMN     "description" TEXT;

-- CreateTable
CREATE TABLE "subcategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "cod_category" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "subcategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "product_images" (
    "cod_product_image" SERIAL NOT NULL,
    "url" TEXT NOT NULL,
    "alt" TEXT,
    "cod_product" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "product_images_pkey" PRIMARY KEY ("cod_product_image")
);

-- CreateIndex
CREATE UNIQUE INDEX "subcategory_name_cod_category_key" ON "subcategory"("name", "cod_category");

-- AddForeignKey
ALTER TABLE "subcategory" ADD CONSTRAINT "subcategory_cod_category_fkey" FOREIGN KEY ("cod_category") REFERENCES "categorys"("cod_category") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "product_images" ADD CONSTRAINT "product_images_cod_product_fkey" FOREIGN KEY ("cod_product") REFERENCES "products"("cod_product") ON DELETE RESTRICT ON UPDATE CASCADE;
