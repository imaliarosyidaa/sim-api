import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { KegiatanDto } from './dto/kegiatan.dto';
import { KegiatanmitraService } from 'src/kegiatanmitra/kegiatanmitra.service';
import { retry } from 'rxjs';

@Injectable()
export class KegiatanService {
    constructor(private prisma: PrismaService, private readonly kegiatanmitraService: KegiatanmitraService,) {}

  async createKegiatan(dto: KegiatanDto  ) {
    const kodeKeg = await this.kegiatanmitraService.generateUniqHash(dto)
    const result =  this.prisma.kegiatan.create({
      data: {
          id: dto.id,
            bulan    :   dto.bulan,
          tanggal  :   dto.tanggal,
            tim :        dto.tim,
          nama_survei : dto.nama_survei,
          nama_survei_sobat : dto.nama_survei_sobat,
          kegiatan   : dto.kegiatan,
          tahun       : dto.tahun,
          kodeKegiatan : kodeKeg,
      },
    });
    return result;
  }

 async getRekapKegiatan(tahun: number) {
    // 1. Ambil semua kegiatan untuk tahun tertentu, diurutkan berdasarkan bulan
    const kegiatan = await this.prisma.kegiatan.findMany({
      where: {
        tahun: tahun,
      },
      select: {
        bulan: true,
        nama_survei: true, // Asumsi nama kolomnya 'kegiatan'
      },
      orderBy: {
        id: 'asc', // Urutkan berdasarkan ID atau properti lain yang relevan
      },
    });

    // 2. Kelompokkan data berdasarkan bulan
    const rekapKegiatan = kegiatan.reduce((acc, current) => {
      // Pastikan nama bulan tidak null
      const bulan = current.bulan || 'Tidak Diketahui'; 
      
      // Jika bulan belum ada di akumulator, inisialisasi array
      if (!acc[bulan]) {
        acc[bulan] = [];
      }
      
      // Tambahkan nama kegiatan ke dalam array bulan yang sesuai
      if (current.nama_survei) {
        acc[bulan].push(current.nama_survei);
      }
      
      return acc;
    }, {});

    // 3. Konversi objek menjadi array dari objek untuk kemudahan mapping di frontend
    const result = Object.keys(rekapKegiatan).map(bulan => ({
      bulan: bulan,
      kegiatan: rekapKegiatan[bulan],
    }));

    return result;
  }
}
