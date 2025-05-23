-- CreateTable
CREATE TABLE "box" (
    "cod_box" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "cod_sucursal" INTEGER NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT true,

    CONSTRAINT "box_pkey" PRIMARY KEY ("cod_box")
);

-- CreateIndex
CREATE UNIQUE INDEX "box_name_key" ON "box"("name");

-- CreateIndex
CREATE INDEX "box_name_idx" ON "box"("name");

-- AddForeignKey
ALTER TABLE "box" ADD CONSTRAINT "box_cod_sucursal_fkey" FOREIGN KEY ("cod_sucursal") REFERENCES "sucursals"("cod_sucursal") ON DELETE RESTRICT ON UPDATE CASCADE;
