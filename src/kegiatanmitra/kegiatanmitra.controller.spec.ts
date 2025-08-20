import { Test, TestingModule } from '@nestjs/testing';
import { KegiatanmitraController } from './kegiatanmitra.controller';

describe('KegiatanmitraController', () => {
  let controller: KegiatanmitraController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [KegiatanmitraController],
    }).compile();

    controller = module.get<KegiatanmitraController>(KegiatanmitraController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
