import { Module } from '@nestjs/common';
import { MitraService } from './mitra.service';
import { MitraController } from './mitra.controller';

@Module({
  providers: [MitraService],
  controllers: [MitraController]
})
export class MitraModule {}
