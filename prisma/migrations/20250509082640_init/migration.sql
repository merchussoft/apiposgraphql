/*
  Warnings:

  - You are about to drop the `box` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "box" DROP CONSTRAINT "box_cod_sucursal_fkey";

-- DropTable
DROP TABLE "box";

-- CreateTable
CREATE TABLE "boxs" (
    "cod_box" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "cod_sucursal" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "boxs_pkey" PRIMARY KEY ("cod_box")
);

-- CreateTable
CREATE TABLE "rols" (
    "cod_rol" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "rols_pkey" PRIMARY KEY ("cod_rol")
);

-- CreateTable
CREATE TABLE "users" (
    "cod_user" SERIAL NOT NULL,
    "users" VARCHAR(30) NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(150) NOT NULL,
    "phone" VARCHAR(20),
    "password" TEXT NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cod_rol" INTEGER NOT NULL,
    "cod_sucursal" INTEGER NOT NULL,

    CONSTRAINT "users_pkey" PRIMARY KEY ("cod_user")
);

-- CreateIndex
CREATE UNIQUE INDEX "boxs_name_key" ON "boxs"("name");

-- CreateIndex
CREATE INDEX "boxs_name_idx" ON "boxs"("name");

-- CreateIndex
CREATE UNIQUE INDEX "rols_name_key" ON "rols"("name");

-- CreateIndex
CREATE INDEX "rols_name_idx" ON "rols"("name");

-- CreateIndex
CREATE UNIQUE INDEX "users_users_key" ON "users"("users");

-- CreateIndex
CREATE UNIQUE INDEX "users_email_key" ON "users"("email");

-- CreateIndex
CREATE INDEX "users_email_idx" ON "users"("email");

-- AddForeignKey
ALTER TABLE "boxs" ADD CONSTRAINT "boxs_cod_sucursal_fkey" FOREIGN KEY ("cod_sucursal") REFERENCES "sucursals"("cod_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_cod_rol_fkey" FOREIGN KEY ("cod_rol") REFERENCES "rols"("cod_rol") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_cod_sucursal_fkey" FOREIGN KEY ("cod_sucursal") REFERENCES "sucursals"("cod_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;
