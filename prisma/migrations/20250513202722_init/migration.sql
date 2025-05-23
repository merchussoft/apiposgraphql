-- CreateEnum
CREATE TYPE "movement_type" AS ENUM ('entrada', 'salida', 'ajuste');

-- CreateTable
CREATE TABLE "clients" (
    "cod_client" SERIAL NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(150) NOT NULL,
    "phone" VARCHAR(20),
    "address" TEXT,

    CONSTRAINT "clients_pkey" PRIMARY KEY ("cod_client")
);

-- CreateTable
CREATE TABLE "payment_types" (
    "cod_payment_type" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "payment_types_pkey" PRIMARY KEY ("cod_payment_type")
);

-- CreateTable
CREATE TABLE "categorys" (
    "cod_category" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "categorys_pkey" PRIMARY KEY ("cod_category")
);

-- CreateTable
CREATE TABLE "products" (
    "cod_product" SERIAL NOT NULL,
    "name" VARCHAR(150) NOT NULL,
    "ean" VARCHAR(50) NOT NULL,
    "bar_code" VARCHAR(50) NOT NULL,
    "unit_price" DECIMAL(10,2) NOT NULL,
    "cod_category" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "products_pkey" PRIMARY KEY ("cod_product")
);

-- CreateTable
CREATE TABLE "inventories" (
    "cod_inventory" SERIAL NOT NULL,
    "cod_product" INTEGER NOT NULL,
    "cod_sucursal" INTEGER NOT NULL,
    "current_stock" INTEGER NOT NULL DEFAULT 0,
    "minimum_stock" INTEGER NOT NULL DEFAULT 5,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "inventories_pkey" PRIMARY KEY ("cod_inventory")
);

-- CreateTable
CREATE TABLE "sales" (
    "cod_sale" SERIAL NOT NULL,
    "cod_user" INTEGER NOT NULL,
    "cod_client" INTEGER NOT NULL,
    "cod_box" INTEGER NOT NULL,
    "sale_date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total" DECIMAL(10,2) NOT NULL,
    "cod_payment_type" INTEGER NOT NULL,

    CONSTRAINT "sales_pkey" PRIMARY KEY ("cod_sale")
);

-- CreateTable
CREATE TABLE "sales_details" (
    "cod_sales_detail" SERIAL NOT NULL,
    "cod_sale" INTEGER NOT NULL,
    "cod_product" INTEGER NOT NULL,
    "amount" INTEGER NOT NULL,
    "unit_price" DECIMAL(10,2) NOT NULL,
    "subtotal" DECIMAL(10,2) NOT NULL,

    CONSTRAINT "sales_details_pkey" PRIMARY KEY ("cod_sales_detail")
);

-- CreateTable
CREATE TABLE "inventory_movements" (
    "cod_inventory_movement" SERIAL NOT NULL,
    "cod_product" INTEGER NOT NULL,
    "cod_sucursal" INTEGER NOT NULL,
    "movement_type" "movement_type" NOT NULL,
    "amount" INTEGER NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cod_user" INTEGER NOT NULL,

    CONSTRAINT "inventory_movements_pkey" PRIMARY KEY ("cod_inventory_movement")
);

-- CreateIndex
CREATE UNIQUE INDEX "clients_name_key" ON "clients"("name");

-- CreateIndex
CREATE UNIQUE INDEX "clients_email_key" ON "clients"("email");

-- CreateIndex
CREATE INDEX "clients_name_idx" ON "clients"("name");

-- CreateIndex
CREATE UNIQUE INDEX "payment_types_name_key" ON "payment_types"("name");

-- CreateIndex
CREATE INDEX "payment_types_name_idx" ON "payment_types"("name");

-- CreateIndex
CREATE INDEX "categorys_name_idx" ON "categorys"("name");

-- CreateIndex
CREATE UNIQUE INDEX "products_ean_key" ON "products"("ean");

-- CreateIndex
CREATE UNIQUE INDEX "products_bar_code_key" ON "products"("bar_code");

-- CreateIndex
CREATE INDEX "products_ean_idx" ON "products"("ean");

-- AddForeignKey
ALTER TABLE "products" ADD CONSTRAINT "products_cod_category_fkey" FOREIGN KEY ("cod_category") REFERENCES "categorys"("cod_category") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventories" ADD CONSTRAINT "inventories_cod_product_fkey" FOREIGN KEY ("cod_product") REFERENCES "products"("cod_product") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventories" ADD CONSTRAINT "inventories_cod_sucursal_fkey" FOREIGN KEY ("cod_sucursal") REFERENCES "sucursals"("cod_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales" ADD CONSTRAINT "sales_cod_user_fkey" FOREIGN KEY ("cod_user") REFERENCES "users"("cod_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales" ADD CONSTRAINT "sales_cod_client_fkey" FOREIGN KEY ("cod_client") REFERENCES "clients"("cod_client") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales" ADD CONSTRAINT "sales_cod_box_fkey" FOREIGN KEY ("cod_box") REFERENCES "boxs"("cod_box") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales" ADD CONSTRAINT "sales_cod_payment_type_fkey" FOREIGN KEY ("cod_payment_type") REFERENCES "payment_types"("cod_payment_type") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales_details" ADD CONSTRAINT "sales_details_cod_product_fkey" FOREIGN KEY ("cod_product") REFERENCES "products"("cod_product") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales_details" ADD CONSTRAINT "sales_details_cod_sale_fkey" FOREIGN KEY ("cod_sale") REFERENCES "sales"("cod_sale") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventory_movements" ADD CONSTRAINT "inventory_movements_cod_product_fkey" FOREIGN KEY ("cod_product") REFERENCES "products"("cod_product") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventory_movements" ADD CONSTRAINT "inventory_movements_cod_sucursal_fkey" FOREIGN KEY ("cod_sucursal") REFERENCES "sucursals"("cod_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventory_movements" ADD CONSTRAINT "inventory_movements_cod_user_fkey" FOREIGN KEY ("cod_user") REFERENCES "users"("cod_user") ON DELETE RESTRICT ON UPDATE CASCADE;
