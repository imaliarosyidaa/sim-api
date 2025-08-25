import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { contains } from 'class-validator';
import { Prisma } from '@prisma/client';
import { totalmem } from 'os';

@Injectable()
export class HonormitraService {
    constructor(private prisma: PrismaService) {}
    
    private readonly rupiahFormatter = new Intl.NumberFormat("id-ID", {
    style: "currency",
    currency: "IDR",
    minimumFractionDigits: 0,
  });
  formatRupiah(value: number): string {
    return this.rupiahFormatter.format(value);
  }

    async getHonorMitra(search: string = '') {
    const where: Prisma.HonorWhereInput = search
        ? {
            mitra: {
                namaLengkap: {
                    contains: search,
                }
            }
        }
        : {};

        const honorMitra = await this.prisma.mitra.findMany({
        select: {
            id: true,
            namaLengkap: true,
            sobatId: true,
            honors: true
        }
        });

        const detailHonorData = honorMitra.map((item) => {
          const latestHonor = item.honors[item.honors.length - 1] || {};

          return {
            id: item.id,
            namaLengkap: item.namaLengkap,
            sobatId: item.sobatId,
            januari: latestHonor.januari || 0,
            februari: latestHonor.februari || 0,
            maret: latestHonor.maret || 0,
            april: latestHonor.april || 0,
            mei: latestHonor.mei || 0,
            juni: latestHonor.juni || 0,
            juli: latestHonor.juli || 0,
            agustus: latestHonor.agustus || 0,
            september: latestHonor.september || 0,
            oktober: latestHonor.oktober || 0,
            november: latestHonor.november || 0,
            desember: latestHonor.desember || 0,
          };
        });

        const detailHonorDataWithTotal = detailHonorData.map((item)=>(
        {
            ...item,
            total:item.januari + item.februari + item.maret + item.april + item.mei + item.juni + item.juli + item.agustus + item.september + item.oktober + item.november + item.desember
        }))
    return detailHonorDataWithTotal;
}

async getRekapHonorPerBulan(selectedYear: number){
    const rekapPerbulan = await this.prisma.honor.findMany({
        where: {
            tahun : selectedYear
        }
    })

    const totalPerBulan = {
        januari: 0,
        februari: 0,
        maret: 0,
        april: 0,
        mei: 0,
        juni: 0,
        juli: 0,
        agustus: 0,
        september: 0,
        oktober: 0,
        november: 0,
        desember: 0
    };

    rekapPerbulan.forEach((honor)=>{
        totalPerBulan.januari += honor.januari;
        totalPerBulan.februari += honor.februari;
        totalPerBulan.maret += honor.maret;
        totalPerBulan.april += honor.april;
        totalPerBulan.mei += honor.mei;
        totalPerBulan.juni += honor.juni;
        totalPerBulan.juli += honor.juli;
        totalPerBulan.agustus += honor.agustus;
        totalPerBulan.september += honor.september;
        totalPerBulan.oktober += honor.oktober;
        totalPerBulan.november += honor.november;
        totalPerBulan.desember += honor.desember;
    })
    const result = Object.entries(totalPerBulan).map(([bulan, total]) => ({
        bulan: bulan.charAt(0).toUpperCase() + bulan.slice(1),
        total: total
    }));

    return result;
}
}