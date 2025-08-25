import { Controller, Get, Post, Body, Delete, Param, BadRequestException, UseInterceptors, UploadedFile } from '@nestjs/common';
import { KegiatanmitraService } from './kegiatanmitra.service';
import { KegiatanMitraDto } from './dto/kegiatanmitra.dto';
import { FileInterceptor } from '@nestjs/platform-express';

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

  @Post('upload')
  @UseInterceptors(FileInterceptor('file'))
  async uploadTemplate(@UploadedFile() file: Express.Multer.File) {
    if (!file) {
      throw new BadRequestException('File tidak ditemukan.');
    }

    const result = await this.KegiatanmitraService.processExcelFile(file);

    return {
      statusCode: 200,
      message: 'File berhasil diunggah dan diproses.',
      data: result,
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