import { Test, TestingModule } from '@nestjs/testing';
import { HonormitraService } from './honormitra.service';

describe('HonormitraService', () => {
  let service: HonormitraService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [HonormitraService],
    }).compile();

    service = module.get<HonormitraService>(HonormitraService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
