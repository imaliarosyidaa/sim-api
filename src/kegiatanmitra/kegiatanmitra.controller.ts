import { Controller, Get, Post, Body, Delete, Param } from '@nestjs/common';
import { KegiatanmitraService } from './kegiatanmitra.service';
import { KegiatanMitraDto } from './dto/kegiatanmitra.dto';

@Controller('kegiatanmitra')
export class KegiatanmitraController {
    constructor(private readonly KegiatanmitraService: KegiatanmitraService) {}

  @Get()
  async getKegiatanMitra() {
    const kegiatanmitra = await this.KegiatanmitraService.getKegiatanMitra();
    return {
      status_code: 200,
      message: 'Succes get all kegiatan mitra',
      data: kegiatanmitra,
    };
  }

  @Post()
  async createKegiatanMitra(@Body() createKegiatanMitra: KegiatanMitraDto ) {
    const response = await this.KegiatanmitraService.createKegiatanMitra(createKegiatanMitra);
    return {
      status_code: 200,
      message: 'Kegiatan Mitra berhasil dibuat',
      data : response,
    };
  }

@Delete('delete')
async deleteKegiatanMitra(@Body() kegiatanMitraDto: KegiatanMitraDto,) {
  const { id } = kegiatanMitraDto; 
    try {
      const result = await this.KegiatanmitraService.deleteKegiatanMitra(
        id
      );

      return {
        message: 'Delete succesfully',
        data: result,
      };
    } catch (error) {
      throw error;
    }
}
}