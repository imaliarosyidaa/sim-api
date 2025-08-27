-- CreateTable
CREATE TABLE "public"."Mitra" (
    "id" SERIAL NOT NULL,
    "namaLengkap" TEXT NOT NULL,
    "posisi" TEXT,
    "statusSeleksi" TEXT,
    "posisiDaftar" TEXT,
    "alamatDetail" TEXT,
    "alamatProv" INTEGER,
    "alamatKab" INTEGER,
    "alamatKec" INTEGER,
    "alamatDesa" INTEGER,
    "tempatTanggalLahir" TEXT,
    "jenisKelamin" TEXT,
    "pendidikan" TEXT,
    "pekerjaan" TEXT,
    "deskripsiPekerjaan" TEXT,
    "noTelp" TEXT,
    "sobatId" TEXT NOT NULL,
    "email" TEXT,

    CONSTRAINT "Mitra_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Honor" (
    "id_honor" SERIAL NOT NULL,
    "sobatId" TEXT NOT NULL,
    "januari" INTEGER NOT NULL DEFAULT 0,
    "februari" INTEGER NOT NULL DEFAULT 0,
    "maret" INTEGER NOT NULL DEFAULT 0,
    "april" INTEGER NOT NULL DEFAULT 0,
    "mei" INTEGER NOT NULL DEFAULT 0,
    "juni" INTEGER NOT NULL DEFAULT 0,
    "juli" INTEGER NOT NULL DEFAULT 0,
    "agustus" INTEGER NOT NULL DEFAULT 0,
    "september" INTEGER NOT NULL DEFAULT 0,
    "oktober" INTEGER NOT NULL DEFAULT 0,
    "november" INTEGER NOT NULL DEFAULT 0,
    "desember" INTEGER NOT NULL DEFAULT 0,
    "tahun" INTEGER NOT NULL,

    CONSTRAINT "Honor_pkey" PRIMARY KEY ("id_honor")
);

-- CreateTable
CREATE TABLE "public"."KegiatanMitra" (
    "id" SERIAL NOT NULL,
    "bulan" TEXT NOT NULL,
    "tanggal" TEXT NOT NULL,
    "tim" TEXT,
    "nama_survei" TEXT NOT NULL,
    "nama_survei_sobat" TEXT,
    "kegiatan" TEXT,
    "pcl_pml_olah" TEXT,
    "nama_petugas" TEXT,
    "id_sobat" TEXT NOT NULL,
    "satuan" TEXT,
    "volum" INTEGER,
    "harga_per_satuan" DECIMAL(12,2),
    "jumlah" DECIMAL(12,2),
    "konfirmasi" TEXT,
    "flag_sobat" TEXT,
    "tahun" INTEGER NOT NULL,
    "kegiatanId" TEXT,

    CONSTRAINT "KegiatanMitra_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."BatasHonor" (
    "id" SERIAL NOT NULL,
    "nama_posisi" TEXT NOT NULL,
    "biaya" INTEGER NOT NULL,
    "keterangan" TEXT,
    "flag" INTEGER,

    CONSTRAINT "BatasHonor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Files" (
    "id" SERIAL NOT NULL,
    "filename" TEXT NOT NULL,
    "originalName" TEXT NOT NULL,
    "mimetype" TEXT NOT NULL,
    "size" INTEGER NOT NULL,
    "path" TEXT NOT NULL,
    "uploadDate" TIMESTAMP(3) NOT NULL,
    "description" TEXT,

    CONSTRAINT "Files_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "public"."Kegiatan" (
    "id" SERIAL NOT NULL,
    "bulan" TEXT NOT NULL,
    "tanggal" TEXT NOT NULL,
    "tim" TEXT,
    "nama_survei" TEXT NOT NULL,
    "nama_survei_sobat" TEXT,
    "kegiatan" TEXT,
    "tahun" INTEGER NOT NULL,
    "kodeKegiatan" TEXT NOT NULL,

    CONSTRAINT "Kegiatan_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Mitra_sobatId_key" ON "public"."Mitra"("sobatId");

-- CreateIndex
CREATE UNIQUE INDEX "Honor_sobatId_tahun_key" ON "public"."Honor"("sobatId", "tahun");

-- CreateIndex
CREATE UNIQUE INDEX "Kegiatan_kodeKegiatan_key" ON "public"."Kegiatan"("kodeKegiatan");

-- AddForeignKey
ALTER TABLE "public"."Honor" ADD CONSTRAINT "Honor_sobatId_fkey" FOREIGN KEY ("sobatId") REFERENCES "public"."Mitra"("sobatId") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."KegiatanMitra" ADD CONSTRAINT "KegiatanMitra_kegiatanId_fkey" FOREIGN KEY ("kegiatanId") REFERENCES "public"."Kegiatan"("kodeKegiatan") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "public"."KegiatanMitra" ADD CONSTRAINT "KegiatanMitra_id_sobat_fkey" FOREIGN KEY ("id_sobat") REFERENCES "public"."Mitra"("sobatId") ON DELETE RESTRICT ON UPDATE CASCADE;
