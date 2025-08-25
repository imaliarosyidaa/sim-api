-- DropForeignKey
ALTER TABLE `kegiatanmitra` DROP FOREIGN KEY `KegiatanMitra_kegiatanId_fkey`;

-- DropIndex
DROP INDEX `KegiatanMitra_kegiatanId_fkey` ON `kegiatanmitra`;

-- AlterTable
ALTER TABLE `kegiatanmitra` MODIFY `kegiatanId` VARCHAR(191) NULL;

-- AddForeignKey
ALTER TABLE `KegiatanMitra` ADD CONSTRAINT `KegiatanMitra_kegiatanId_fkey` FOREIGN KEY (`kegiatanId`) REFERENCES `Kegiatan`(`kodeKegiatan`) ON DELETE SET NULL ON UPDATE CASCADE;
