import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { PrismaModule } from './prisma/prisma.module';
import { MitraModule } from './mitra/mitra.module';
import { KegiatanmitraModule } from './kegiatanmitra/kegiatanmitra.module';
import { BatashonorModule } from './batashonor/batashonor.module';
import { FilesModule } from './files/files.module';

@Module({
  imports: [PrismaModule, MitraModule, KegiatanmitraModule, BatashonorModule, FilesModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
