-- AlterTable
ALTER TABLE `kegiatanmitra` ADD COLUMN `nama_petugas` VARCHAR(191) NULL,
    ADD COLUMN `tahun` INTEGER NULL,
    MODIFY `nama_survei_sobat` VARCHAR(191) NULL,
    MODIFY `kegiatan` VARCHAR(191) NULL,
    MODIFY `pcl_pml_olah` VARCHAR(191) NULL,
    MODIFY `id_sobat` VARCHAR(191) NULL,
    MODIFY `volum` INTEGER NULL;
