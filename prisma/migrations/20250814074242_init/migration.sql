/*
  Warnings:

  - You are about to drop the column `jenis_kelamin` on the `mitra` table. All the data in the column will be lost.
  - You are about to drop the column `kecamatan` on the `mitra` table. All the data in the column will be lost.
  - You are about to drop the column `nama` on the `mitra` table. All the data in the column will be lost.
  - Added the required column `namaLengkap` to the `Mitra` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Mitra_email_key` ON `mitra`;

-- AlterTable
ALTER TABLE `mitra` DROP COLUMN `jenis_kelamin`,
    DROP COLUMN `kecamatan`,
    DROP COLUMN `nama`,
    ADD COLUMN `alamatDesa` INTEGER NULL,
    ADD COLUMN `alamatDetail` VARCHAR(191) NULL,
    ADD COLUMN `alamatKab` INTEGER NULL,
    ADD COLUMN `alamatKec` INTEGER NULL,
    ADD COLUMN `alamatProv` INTEGER NULL,
    ADD COLUMN `deskripsiPekerjaan` VARCHAR(191) NULL,
    ADD COLUMN `jenisKelamin` VARCHAR(191) NULL,
    ADD COLUMN `namaLengkap` VARCHAR(191) NOT NULL,
    ADD COLUMN `noTelp` VARCHAR(191) NULL,
    ADD COLUMN `pekerjaan` VARCHAR(191) NULL,
    ADD COLUMN `pendidikan` VARCHAR(191) NULL,
    ADD COLUMN `posisi` VARCHAR(191) NULL,
    ADD COLUMN `posisiDaftar` VARCHAR(191) NULL,
    ADD COLUMN `sobatId` INTEGER NULL,
    ADD COLUMN `statusSeleksi` VARCHAR(191) NULL,
    ADD COLUMN `tempatTanggalLahir` VARCHAR(191) NULL,
    MODIFY `email` VARCHAR(191) NULL;
