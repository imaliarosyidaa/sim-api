/*
  Warnings:

  - You are about to drop the column `id_mitra` on the `honor` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[sobatId,tahun]` on the table `Honor` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nama_survei_sobat]` on the table `KegiatanMitra` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id_sobat]` on the table `KegiatanMitra` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[sobatId]` on the table `Mitra` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `sobatId` to the `Honor` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `honor` DROP FOREIGN KEY `Honor_id_mitra_fkey`;

-- DropIndex
DROP INDEX `Honor_id_mitra_fkey` ON `honor`;

-- DropIndex
DROP INDEX `KegiatanMitra_id_nama_survei_sobat_id_sobat_key` ON `kegiatanmitra`;

-- AlterTable
ALTER TABLE `honor` DROP COLUMN `id_mitra`,
    ADD COLUMN `sobatId` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Honor_sobatId_tahun_key` ON `Honor`(`sobatId`, `tahun`);

-- CreateIndex
CREATE UNIQUE INDEX `KegiatanMitra_nama_survei_sobat_key` ON `KegiatanMitra`(`nama_survei_sobat`);

-- CreateIndex
CREATE UNIQUE INDEX `KegiatanMitra_id_sobat_key` ON `KegiatanMitra`(`id_sobat`);

-- CreateIndex
CREATE UNIQUE INDEX `Mitra_sobatId_key` ON `Mitra`(`sobatId`);

-- AddForeignKey
ALTER TABLE `Honor` ADD CONSTRAINT `Honor_sobatId_fkey` FOREIGN KEY (`sobatId`) REFERENCES `Mitra`(`sobatId`) ON DELETE RESTRICT ON UPDATE CASCADE;
