import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { KegiatanService } from './kegiatan.service';
import { KegiatanDto } from './dto/kegiatan.dto';

@Controller('kegiatan')
export class KegiatanController {
    constructor(private readonly kegiatanService: KegiatanService) {}

    @Post()
    async createKegiatanMitra(@Body() kegiatanDto: KegiatanDto ) {
        const response = await this.kegiatanService.createKegiatan(kegiatanDto);
        return {
          status_code: 200,
          message: 'Kegiatan berhasil dibuat',
          data : response,
        };
      }

  @Get(':tahun')
  async getClassByPengajarId(@Param('tahun') tahun: string) {
    const year = Number(tahun);
    return this.kegiatanService.getRekapKegiatan(year);
  }
}
