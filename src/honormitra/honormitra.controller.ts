import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { HonormitraService } from './honormitra.service';

@Controller('honormitra')
export class HonormitraController {
    constructor(private readonly honorMitraService: HonormitraService){}

    @Get()
    async getHonorMitra(){
        const honorMitra = await this.honorMitraService.getHonorMitra()
        
        return {
            status_code: 200,
            message: 'Succes get all movies',
            data: honorMitra,
        };
    }

    @Get('rekap/:year')
    async getRekapHonorPerBulan(@Param('year') year: string) {
        const selectedYear = parseInt(year);

        const rekapHonorPerBulan = await this.honorMitraService.getRekapHonorPerBulan(selectedYear);
        return {
            status_code: 200,
            message: 'Succes get rekap honor per bulan',
            data: rekapHonorPerBulan,
        };
    }
}