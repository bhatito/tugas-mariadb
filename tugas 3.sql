soal 3.1
1.MariaDB [dbtoko1]> SELECT * FROM produk WHERE harga_beli * stok > 20000000; 
2. MariaDB [dbtoko1]> SELECT SUM(stok - min_stok) as selisih from produk;
3. MariaDB [dbtoko1]> SELECT sum(stok) as total_asset from produk;
4. MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir) BETWEEN 1999 AND 2004;
5. MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE YEAR(tgl_lahir)=1998;
6. MariaDB [dbtoko1]> SELECT * FROM pelanggan WHERE MONTH(tgl_lahir)=08;
7. MariaDB [dbtoko1]> SELECT nama, tmp_lahir, tgl_lahir, (YEAR(NOW())-YEAR(tgl_lahir)) AS umur FROM pelanggan;


soal 3.2
1. MariaDB [dbtoko1]> select sum(year(tgl_lahir) =1998) as jumlah_pelanggan from pelanggan;
2. select sum(jk='P') as jumlah_pelanggan_perempuan from pelanggan where tmp_lahir='Jakarta' ;
3. MariaDB [dbtoko1]> select sum(stok) from produk where harga_beli*stok <10000;
4. MariaDB [dbtoko1]> select count(nama) as jumlah_produk from produk where kode like 'k%';
5. MariaDB [dbtoko1]> select count(harga_jual) from produk where harga_jual > 1000000;
6. SELECT * FROM produk ORDER BY stok DESC LIMIT 1;
7. MariaDB [dbtoko1]> select count(nama) from produk where stok <= min_stok;
8. MariaDB [dbtoko1]> SELECT sum(harga_beli * stok) as total_asset from produk;

soal 3.3
1. MariaDB [dbtoko1]>  select id,nama,stok,
    ->      case
    ->      when stok <= min_stok then 'segera belanja'
    ->      else 'stok aman'
    ->      end as keterangan
    ->      from produk;
2. MariaDB [dbtoko1]> select id,nama_pelanggan,
    -> case
    -> when umur <= 17 then 'muda'
    -> when umur between 17 and 55 then 'dewasa'
    -> else 'tua'
    -> end as keterangan
    -> from(select id,nama_pelanggan, tgl_lahir, timestampdiff(year, tgl_lahir, curdate()) as umur 
3. MariaDB [dbtoko1]> select id,kode,nama,
    -> case
    -> when kode = 'TV01' then 'DVD Player'
    -> when kode = 'K001' then 'Rice Cooker'
    -> else 'tidak ada'
    -> end as bonus
    -> from produk;

soal 3.4
1. MariaDB [dbtoko1]> select count(tmp_lahir) from pelanggan;
2. select jenis_produk_id, sum(harga_jual*stok) as total_produk from produk group by jenis_produk_id;
3. select id,kode,nama_pelanggan, (year(now())-year(tgl_lahir)) AS umur FROM pelanggan
where (year(now())-year(tgl_lahir)) < (select avg((year(now())-year(tgl_lahir)))as rata_rata FROM pelanggan);
4. MariaDB [dbtoko1]> select id, nama as data_produk, harga_jual as diatas_rata_rata  from  produk where harga_jual > (select avg(harga_jual) as rata_rata FROM produk);
