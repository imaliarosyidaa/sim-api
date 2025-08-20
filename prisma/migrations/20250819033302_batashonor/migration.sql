/*
  Warnings:

  - A unique constraint covering the columns `[nama_survei_sobat,id_sobat]` on the table `KegiatanMitra` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateTable
CREATE TABLE `BatasHonor` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_posisi` VARCHAR(191) NOT NULL,
    `biaya` INTEGER NOT NULL,
    `keterangan` VARCHAR(191) NULL,
    `flag` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `KegiatanMitra_nama_survei_sobat_id_sobat_key` ON `KegiatanMitra`(`nama_survei_sobat`, `id_sobat`);
