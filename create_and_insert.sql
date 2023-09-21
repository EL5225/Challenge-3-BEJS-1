-- Membuat Database
CREATE DATABASE db_banking_system;

-- Membuat Table
CREATE TABLE nasabah(
    id BIGSERIAL PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    domisili TEXT NOT NULL
);

CREATE TABLE akun(
    id BIGSERIAL PRIMARY KEY,
    nama VARCHAR(50) NOT NULL,
    saldo BIGINT NOT NULL,
    nasabah_id INTEGER NOT NULL
);

CREATE TABLE transaksi(
    id BIGSERIAL PRIMARY KEY,
    tgl_transaksi DATE NOT NULL,
    nominal BIGINT NOT NULL,
    akun_id INTEGER NOT NULL
);


-- Insert Data awal
INSERT INTO nasabah (nama, domisili) 
VALUES ('Amelia', 'Bandung'), ('Halimawan', 'Jakarta'), ('Caca', 'Surabaya');

INSERT INTO akun (nama, saldo, nasabah_id) 
VALUES ('Amelia Utama', 1000000, 1), ('Halimawan Utama', 2506300, 2), ('Caca Utama', 4210000, 3), ('Amelia Cadangan', 500000, 1);

INSERT INTO transaksi (tgl_transaksi, nominal, akun_id) 
VALUES ('2023-01-23', 50000, 1), ('2022-06-02', 30000, 2), ('2022-11-03', 10000, 3), ('2022-10-24', 200000, 1);

-- Membaca data
SELECT * FROM nasabah;
SELECT * FROM akun;
SELECT * FROM transaksi;


-- Relasi antar entitas menggunakan JOIN
SELECT n.id AS id_nasabah, n.nama, count(a.id) AS jumlah_akun
FROM nasabah n 
LEFT JOIN akun a ON n.id = a.nasabah_id
GROUP by n.id, n.nama
ORDER BY n.id;

SELECT n.id AS id_nasabah, n.nama, count(t.id) AS jumlah_transaksi
FROM nasabah n 
JOIN akun a ON n.id = a.nasabah_id
LEFT JOIN transaksi t ON a.id = t.akun_id
GROUP by n.id, n.nama
ORDER BY n.id;


-- CRUD
INSERT INTO nasabah (nama, domisili) 
VALUES ('Kevin', 'Sumedang'), ('Rina', 'Aceh');

INSERT INTO akun (nama, saldo, nasabah_id) 
VALUES ('Kevin Utama', 5000000, 4), ('Kevin Cadangan', 20000000, 4);

UPDATE akun SET saldo = saldo + 100000 WHERE id > 2;

DELETE FROM akun WHERE id = > 4;



-- Muhammad Luthfi Ramadhan == BEJS - 1