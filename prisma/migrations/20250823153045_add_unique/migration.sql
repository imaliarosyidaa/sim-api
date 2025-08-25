-- AlterTable
ALTER TABLE `kegiatanmitra` ADD COLUMN `kegiatanId` INTEGER NULL;

-- CreateTable
CREATE TABLE `Kegiatan` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bulan` VARCHAR(191) NOT NULL,
    `tanggal` VARCHAR(191) NOT NULL,
    `tim` VARCHAR(191) NULL,
    `nama_survei` VARCHAR(191) NOT NULL,
    `nama_survei_sobat` VARCHAR(191) NULL,
    `kegiatan` VARCHAR(191) NULL,
    `tahun` INTEGER NOT NULL,
    `kodeKegiatan` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Kegiatan_kodeKegiatan_key`(`kodeKegiatan`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `KegiatanMitra` ADD CONSTRAINT `KegiatanMitra_kegiatanId_fkey` FOREIGN KEY (`kegiatanId`) REFERENCES `Kegiatan`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
