import { Test, TestingModule } from '@nestjs/testing';
import { BatashonorService } from './batashonor.service';

describe('BatashonorService', () => {
  let service: BatashonorService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [BatashonorService],
    }).compile();

    service = module.get<BatashonorService>(BatashonorService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
