import { Test, TestingModule } from '@nestjs/testing';
import { KegiatanmitraService } from './kegiatanmitra.service';

describe('KegiatanmitraService', () => {
  let service: KegiatanmitraService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [KegiatanmitraService],
    }).compile();

    service = module.get<KegiatanmitraService>(KegiatanmitraService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
