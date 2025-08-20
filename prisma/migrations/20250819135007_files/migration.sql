/*
  Warnings:

  - A unique constraint covering the columns `[id,nama_survei_sobat,id_sobat]` on the table `KegiatanMitra` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX `KegiatanMitra_nama_survei_sobat_id_sobat_key` ON `kegiatanmitra`;

-- CreateTable
CREATE TABLE `Files` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `filename` VARCHAR(191) NOT NULL,
    `originalName` VARCHAR(191) NOT NULL,
    `mimetype` VARCHAR(191) NOT NULL,
    `size` INTEGER NOT NULL,
    `path` VARCHAR(191) NOT NULL,
    `uploadDate` DATETIME(3) NOT NULL,
    `description` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `KegiatanMitra_id_nama_survei_sobat_id_sobat_key` ON `KegiatanMitra`(`id`, `nama_survei_sobat`, `id_sobat`);
