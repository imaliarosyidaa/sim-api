import { Module } from '@nestjs/common';
import { BatashonorController } from './batashonor.controller';
import { BatashonorService } from './batashonor.service';

@Module({
  controllers: [BatashonorController],
  providers: [BatashonorService]
})
export class BatashonorModule {}
