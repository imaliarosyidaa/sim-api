/*
  Warnings:

  - You are about to alter the column `harga_per_satuan` on the `kegiatanmitra` table. The data in that column could be lost. The data in that column will be cast from `Decimal(7,2)` to `Decimal(12,2)`.
  - You are about to alter the column `jumlah` on the `kegiatanmitra` table. The data in that column could be lost. The data in that column will be cast from `Decimal(9,2)` to `Decimal(12,2)`.

*/
-- AlterTable
ALTER TABLE `kegiatanmitra` MODIFY `harga_per_satuan` DECIMAL(12, 2) NULL,
    MODIFY `jumlah` DECIMAL(12, 2) NULL;
