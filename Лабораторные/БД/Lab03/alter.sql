use Lab03;
alter table GOODS add ArrivalDate date;

alter table GOODS add check (Price < 1000);