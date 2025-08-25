import { Module } from '@nestjs/common';
import { KegiatanmitraService } from './kegiatanmitra.service';
import { KegiatanmitraController } from './kegiatanmitra.controller';

@Module({
  providers: [KegiatanmitraService],
  controllers: [KegiatanmitraController],
  exports: [KegiatanmitraService],
})
export class KegiatanmitraModule {}
