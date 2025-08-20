/*
  Warnings:

  - You are about to drop the column `id_tahun` on the `honor` table. All the data in the column will be lost.
  - You are about to drop the column `nama_mitra` on the `honor` table. All the data in the column will be lost.
  - You are about to drop the column `id_honor` on the `mitra` table. All the data in the column will be lost.
  - You are about to drop the column `rating` on the `mitra` table. All the data in the column will be lost.
  - Added the required column `id_mitra` to the `Honor` table without a default value. This is not possible if the table is not empty.
  - Added the required column `tahun` to the `Honor` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `mitra` DROP FOREIGN KEY `Mitra_id_honor_fkey`;

-- DropIndex
DROP INDEX `Mitra_id_honor_fkey` ON `mitra`;

-- AlterTable
ALTER TABLE `honor` DROP COLUMN `id_tahun`,
    DROP COLUMN `nama_mitra`,
    ADD COLUMN `id_mitra` INTEGER NOT NULL,
    ADD COLUMN `tahun` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `mitra` DROP COLUMN `id_honor`,
    DROP COLUMN `rating`;

-- AddForeignKey
ALTER TABLE `Honor` ADD CONSTRAINT `Honor_id_mitra_fkey` FOREIGN KEY (`id_mitra`) REFERENCES `Mitra`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
