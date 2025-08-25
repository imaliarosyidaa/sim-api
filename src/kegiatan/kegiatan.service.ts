import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { KegiatanDto } from './dto/kegiatan.dto';
import { KegiatanmitraService } from 'src/kegiatanmitra/kegiatanmitra.service';

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
}
