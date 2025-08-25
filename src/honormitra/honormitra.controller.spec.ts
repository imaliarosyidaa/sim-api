import { Test, TestingModule } from '@nestjs/testing';
import { HonormitraController } from './honormitra.controller';

describe('HonormitraController', () => {
  let controller: HonormitraController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [HonormitraController],
    }).compile();

    controller = module.get<HonormitraController>(HonormitraController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
