import { Module } from '@nestjs/common';
import { KegiatanService } from './kegiatan.service';
import { KegiatanController } from './kegiatan.controller';
import { KegiatanmitraModule } from 'src/kegiatanmitra/kegiatanmitra.module';

@Module({
  providers: [KegiatanService],
  controllers: [KegiatanController],
  imports: [KegiatanmitraModule], 
})
export class KegiatanModule {}
