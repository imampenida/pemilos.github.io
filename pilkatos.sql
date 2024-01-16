-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Sep 2023 pada 17.55
-- Versi server: 10.4.17-MariaDB
-- Versi PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pilkatos`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_admin`
--

CREATE TABLE `tb_admin` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_admin`
--

INSERT INTO `tb_admin` (`username`, `password`) VALUES
('admin', 'd0970714757783e6cf17b26fb8e2298f');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_datapilketos`
--

CREATE TABLE `tb_datapilketos` (
  `id` int(1) NOT NULL DEFAULT 1,
  `tapel` varchar(10) NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_datapilketos`
--

INSERT INTO `tb_datapilketos` (`id`, `tapel`, `tgl`) VALUES
(1, '2023/2024', '2023-10-04');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_identitassekolah`
--

CREATE TABLE `tb_identitassekolah` (
  `npsn` varchar(15) NOT NULL,
  `nm_sekolah` varchar(32) NOT NULL,
  `jln` varchar(32) DEFAULT NULL,
  `desa` varchar(32) DEFAULT NULL,
  `kec` varchar(32) DEFAULT NULL,
  `kab` varchar(32) DEFAULT NULL,
  `kpl_sekolah` varchar(32) DEFAULT NULL,
  `nip` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_identitassekolah`
--

INSERT INTO `tb_identitassekolah` (`npsn`, `nm_sekolah`, `jln`, `desa`, `kec`, `kab`, `kpl_sekolah`, `nip`) VALUES
('12345', 'SMN N 3 Magelang', 'Jl. Sri SUltan No 123', 'Diega', 'Kilir', 'Suka Bumi', 'Surya, S.Ag', '12345678');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_kelas`
--

CREATE TABLE `tb_kelas` (
  `kd_kelas` int(3) NOT NULL,
  `nm_kelas` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_kelas`
--

INSERT INTO `tb_kelas` (`kd_kelas`, `nm_kelas`) VALUES
(17, 'VII A'),
(18, 'VII B'),
(19, 'VII C'),
(20, 'VIII A'),
(21, 'VIII B'),
(22, 'IX A'),
(23, 'IX B'),
(24, 'IX C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pilih`
--

CREATE TABLE `tb_pilih` (
  `id_pilih` int(11) NOT NULL,
  `nisn` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pilih`
--

INSERT INTO `tb_pilih` (`id_pilih`, `nisn`, `username`) VALUES
(140, '001', '001'),
(141, '002', '002'),
(142, '002', '003'),
(143, '003', '004');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pilihan`
--

CREATE TABLE `tb_pilihan` (
  `nisn` varchar(32) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `visimisi` text DEFAULT NULL,
  `photo` varchar(32) NOT NULL,
  `no` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_pilihan`
--

INSERT INTO `tb_pilihan` (`nisn`, `nama`, `visimisi`, `photo`, `no`) VALUES
('001', 'Faldy & Diva', 'Visi : Jelas\r\nMisi : Jelas', '001.jpg', 1),
('002', 'Salwa & Daffa', 'Visi : Jelas\r\nMisi : Jelas', '002.jpg', 2),
('003', 'Naira & Dinda', 'Visi : Jelas\r\nMisi : Jelas', '003.jpg', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `nm_siswa` varchar(32) DEFAULT NULL,
  `jk` char(1) NOT NULL,
  `kd_kelas` int(3) DEFAULT NULL,
  `hadir` varchar(12) NOT NULL DEFAULT 'Tidak Hadir'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tb_siswa`
--

INSERT INTO `tb_siswa` (`username`, `password`, `nm_siswa`, `jk`, `kd_kelas`, `hadir`) VALUES
('001', '001', 'Fadly', 'L', 17, 'Hadir'),
('002', '002', 'Salwa', 'P', 18, 'Hadir'),
('003', '003', 'Daffa', 'L', 20, 'Hadir'),
('004', '004', 'Naira', 'P', 22, 'Hadir');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_daftarhadir`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_daftarhadir` (
`NISN` varchar(32)
,`nm_siswa` varchar(32)
,`nm_kelas` varchar(32)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `view_vote`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `view_vote` (
`nisn` varchar(32)
,`nama` varchar(32)
,`photo` varchar(32)
,`no` int(1)
,`username` varchar(32)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `view_daftarhadir`
--
DROP TABLE IF EXISTS `view_daftarhadir`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_daftarhadir`  AS SELECT `tb_siswa`.`username` AS `NISN`, `tb_siswa`.`nm_siswa` AS `nm_siswa`, `tb_kelas`.`nm_kelas` AS `nm_kelas` FROM ((`tb_siswa` join `tb_kelas` on(`tb_kelas`.`kd_kelas` = `tb_siswa`.`kd_kelas`)) join `tb_pilih` on(`tb_siswa`.`username` = `tb_pilih`.`username`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `view_vote`
--
DROP TABLE IF EXISTS `view_vote`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_vote`  AS SELECT `tb_pilihan`.`nisn` AS `nisn`, `tb_pilihan`.`nama` AS `nama`, `tb_pilihan`.`photo` AS `photo`, `tb_pilihan`.`no` AS `no`, `tb_siswa`.`username` AS `username` FROM ((`tb_pilih` join `tb_pilihan` on(`tb_pilihan`.`nisn` = `tb_pilih`.`nisn`)) join `tb_siswa` on(`tb_siswa`.`username` = `tb_pilih`.`username`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `tb_datapilketos`
--
ALTER TABLE `tb_datapilketos`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tb_identitassekolah`
--
ALTER TABLE `tb_identitassekolah`
  ADD PRIMARY KEY (`npsn`);

--
-- Indeks untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  ADD PRIMARY KEY (`kd_kelas`);

--
-- Indeks untuk tabel `tb_pilih`
--
ALTER TABLE `tb_pilih`
  ADD PRIMARY KEY (`id_pilih`);

--
-- Indeks untuk tabel `tb_pilihan`
--
ALTER TABLE `tb_pilihan`
  ADD PRIMARY KEY (`nisn`);

--
-- Indeks untuk tabel `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tb_kelas`
--
ALTER TABLE `tb_kelas`
  MODIFY `kd_kelas` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `tb_pilih`
--
ALTER TABLE `tb_pilih`
  MODIFY `id_pilih` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
