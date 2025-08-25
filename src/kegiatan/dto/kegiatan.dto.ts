import {
  IsEmail,
  IsEnum,
  IsNotEmpty,
  IsOptional,
  IsString,
} from 'class-validator';

export class KegiatanDto {
  
  @IsOptional()
  id: number

    @IsString()
    @IsNotEmpty()
    bulan    :   string
  
  @IsString()
    @IsNotEmpty()
  tanggal  :   string

  @IsString()
    @IsNotEmpty()
    tim :        string

  @IsString()
  nama_survei : string

  @IsString()
  nama_survei_sobat : string

  @IsString()
  kegiatan   : string

  tahun       : number

  @IsString()
  kodeKegiatan : string
}
