import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { KegiatanMitraDto } from './dto/kegiatanmitra.dto';

@Injectable()
export class KegiatanmitraService {
    constructor(private prisma: PrismaService) {}

  async getKegiatanMitra() {
    const data = await this.prisma.kegiatanMitra.groupBy({
        by: ['nama_survei_sobat', 'bulan','tanggal','tim','nama_survei','kegiatan','nama_petugas','id','id_sobat', 'pcl_pml_olah', 'satuan', 'konfirmasi', 'flag_sobat'],
        _sum:{
            volum: true,
            harga_per_satuan: true,
            jumlah: true,
        }
    });

    // Transform jadi nested JSON
  const grouped = data.reduce((acc, item) => {
    const key = item.nama_survei_sobat ?? 'UNKNOWN';

    if (!acc[key]) {
      acc[key] = {
        id: item.id,
        nama_survei_sobat: key,
        bulan : item.bulan,
        tanggal: item.tanggal,
        tim: item.tim,
        nama_survei: item.nama_survei,
        kegiatan: item.kegiatan,
        pcl_pml_olah : item.pcl_pml_olah,
        satuan : item.satuan,
        data: []
      };
    }

    acc[key].data.push({
      id: item.id,
      id_sobat : item.id_sobat,
      nama_petugas : item.nama_petugas,
      volum : item._sum.volum,
      harga_per_satuan : item._sum.harga_per_satuan,
      jumlah : item._sum.jumlah,
    });

    return acc;
  }, {} as Record<string, any>);

  return Object.values(grouped);
  }

  async getKegiatanMitraById(id: number) {
    const semua = await this.getKegiatanMitra()
    return semua.find((item)=> item.id === id)
  }

  async createKegiatanMitra(dto: KegiatanMitraDto  ) {
    return this.prisma.kegiatanMitra.create({
      data: {
        bulan: dto.bulan,
        tanggal: dto.tanggal,
        tim: dto.tim,
        nama_survei: dto.nama_survei,
        nama_survei_sobat: dto.nama_survei_sobat,
        kegiatan: dto.kegiatan,
        pcl_pml_olah: dto.pcl_pml_olah,
        nama_petugas: dto.nama_petugas,
        id_sobat: dto.id_sobat,
        satuan: dto.satuan,
        volum: dto.volum,
        harga_per_satuan: dto.harga_per_satuan,
        jumlah: dto.jumlah,
        konfirmasi: dto.konfirmasi,
        flag_sobat: dto.flag_sobat,
        tahun: dto.tahun,
      },
    });
  }

async deleteKegiatanMitra(id: number) {
  const classToDelete = await this.prisma.kegiatanMitra.findUnique({
      where: { id },
    });

    if (!classToDelete) {
      throw new NotFoundException('Class not found');
    }

    await this.prisma.kegiatanMitra.delete({
      where: { id },
    });

    return { status: 'success', message: 'Class deleted successfully' };
}
}
