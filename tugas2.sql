soal 2.3

2. select * from produk where kode like'K%' or kode like 'T%';
3. select * from produk where kode='TV01' or kode='TV02';
4. select * from pelanggan where nama_pelanggan like'SA%';
5. select * from pelanggan where tmp_lahir='ya%' or nama_pelanggan like'%yo%';
6. select * from pelanggan where nama_pelanggan like '_A%';

soal 2.4

2. SELECT *FROM produk ORDER BY harga_beli ASC LIMIT 1;
3. SELECT *FROM produk ORDER BY stok DESC LIMIT 1;
4. SELECT *FROM produk ORDER BY stok ASC LIMIT 2;
5. select nama_pelanggan, tgl_lahir, timestampdiff(year, tgl_lahir, curdate()) as umur from pelanggan where id=8;
6. select nama_pelanggan, tgl_lahir, timestampdiff(year, tgl_lahir, curdate()) as umur from pelanggan where id=2;