-- CreateTable
CREATE TABLE `KegiatanMitra` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `bulan` VARCHAR(191) NOT NULL,
    `tanggal` VARCHAR(191) NOT NULL,
    `tim` VARCHAR(191) NOT NULL,
    `nama_survei` VARCHAR(191) NOT NULL,
    `nama_survei_sobat` VARCHAR(191) NOT NULL,
    `kegiatan` VARCHAR(191) NOT NULL,
    `pcl_pml_olah` VARCHAR(191) NOT NULL,
    `id_sobat` VARCHAR(191) NOT NULL,
    `satuan` VARCHAR(191) NOT NULL,
    `volum` INTEGER NOT NULL,
    `harga_per_satuan` DECIMAL(7, 2) NOT NULL,
    `jumlah` DECIMAL(9, 2) NOT NULL,
    `konfirmasi` VARCHAR(191) NULL,
    `flag_sobat` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
