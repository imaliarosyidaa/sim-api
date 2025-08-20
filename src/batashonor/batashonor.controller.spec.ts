import { Test, TestingModule } from '@nestjs/testing';
import { BatashonorController } from './batashonor.controller';

describe('BatashonorController', () => {
  let controller: BatashonorController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [BatashonorController],
    }).compile();

    controller = module.get<BatashonorController>(BatashonorController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
