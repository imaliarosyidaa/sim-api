import {
  IsEmail,
  IsEnum,
  IsNotEmpty,
  IsOptional,
  IsString,
} from 'class-validator';

export class KegiatanMitraDto {
  
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

  @IsString()
  pcl_pml_olah : string

  @IsString()
  nama_petugas : string

  @IsString()
  id_sobat   : string
  
  @IsString()
  satuan   :   string

  volum     :  number

  harga_per_satuan  : number
  
  jumlah     : number
  
  @IsString()
  konfirmasi : string
  
  @IsString()
  flag_sobat : string
  
  tahun       : number
}
