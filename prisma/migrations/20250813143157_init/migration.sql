-- CreateTable
CREATE TABLE `Mitra` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nama` VARCHAR(191) NOT NULL,
    `kecamatan` VARCHAR(191) NULL,
    `jenis_kelamin` ENUM('L', 'P') NULL,
    `email` VARCHAR(191) NOT NULL,
    `rating` DECIMAL(65, 30) NULL,
    `id_honor` INTEGER NULL,

    UNIQUE INDEX `Mitra_email_key`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Honor` (
    `id_honor` INTEGER NOT NULL AUTO_INCREMENT,
    `nama_mitra` VARCHAR(191) NOT NULL,
    `januari` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `februari` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `maret` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `april` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `mei` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `juni` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `juli` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `agustus` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `september` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `oktober` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `november` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `desember` DECIMAL(65, 30) NOT NULL DEFAULT 0,
    `id_tahun` INTEGER NOT NULL,

    PRIMARY KEY (`id_honor`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Mitra` ADD CONSTRAINT `Mitra_id_honor_fkey` FOREIGN KEY (`id_honor`) REFERENCES `Honor`(`id_honor`) ON DELETE SET NULL ON UPDATE CASCADE;
