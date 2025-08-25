/*
  Warnings:

  - You are about to alter the column `januari` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `februari` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `maret` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `april` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `mei` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `juni` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `juli` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `agustus` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `september` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `oktober` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `november` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - You are about to alter the column `desember` on the `honor` table. The data in that column could be lost. The data in that column will be cast from `Decimal(65,30)` to `Int`.
  - Made the column `sobatId` on table `mitra` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX `KegiatanMitra_id_sobat_key` ON `kegiatanmitra`;

-- DropIndex
DROP INDEX `KegiatanMitra_nama_survei_sobat_key` ON `kegiatanmitra`;

-- AlterTable
ALTER TABLE `honor` MODIFY `januari` INTEGER NOT NULL DEFAULT 0,
    MODIFY `februari` INTEGER NOT NULL DEFAULT 0,
    MODIFY `maret` INTEGER NOT NULL DEFAULT 0,
    MODIFY `april` INTEGER NOT NULL DEFAULT 0,
    MODIFY `mei` INTEGER NOT NULL DEFAULT 0,
    MODIFY `juni` INTEGER NOT NULL DEFAULT 0,
    MODIFY `juli` INTEGER NOT NULL DEFAULT 0,
    MODIFY `agustus` INTEGER NOT NULL DEFAULT 0,
    MODIFY `september` INTEGER NOT NULL DEFAULT 0,
    MODIFY `oktober` INTEGER NOT NULL DEFAULT 0,
    MODIFY `november` INTEGER NOT NULL DEFAULT 0,
    MODIFY `desember` INTEGER NOT NULL DEFAULT 0;

-- AlterTable
ALTER TABLE `kegiatanmitra` MODIFY `tim` VARCHAR(191) NULL,
    MODIFY `satuan` VARCHAR(191) NULL,
    MODIFY `harga_per_satuan` DECIMAL(7, 2) NULL,
    MODIFY `jumlah` DECIMAL(9, 2) NULL;

-- AlterTable
ALTER TABLE `mitra` MODIFY `sobatId` VARCHAR(191) NOT NULL;
