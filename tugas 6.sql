//menambahkan kolom pembayaran_id pada table pesanan
alter pesanan add pembayaran_id int(11);

//menambahkan kolom status_pembayaran pada table pembayaran
alter pembayaran add status_pembayaran varchar(20);

//trigger
DELIMITER $$
CREATE TRIGGER transaksi_update_before  BEFORE UPDATE on pesanan
FOR EACH ROW
BEGIN
IF OLD.id = NEW.pembayaran_id then
set @status = (select status_pembayaranan from pesanan where id = old.pembayaran_id);
if @status < 'belum dibayar' then
signal sqlstate '45000' set message_text = 'warning: belum lunas';
end if;
update pembayaran set status_pembayaran = @status where id = old.pembayaran_id;
else 
set @status_baru = (select status_pembayaranan from pembayaran where id = old.pembayaran_id);
update pembayaran set status = @status_lama where id = old.pembayaran_id;
set @status_baru = (select status_pembayaran from pembayaran where id = new.pembayaran_id);
if @status_baru < 'sudah dibayar' then
signal sqlstate '45000' set message_text = 'Warning: lunas';
end if;
update pembayaran set status = @status_baru where id = new.pembayaran_id;
end if;
end;
$$
DELIMITER ;
