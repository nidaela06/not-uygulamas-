-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 07 May 2026, 12:15:36
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `not`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `alarm`
--

CREATE TABLE `alarm` (
  `ID` int(11) NOT NULL,
  `saat` varchar(10) NOT NULL,
  `tarih` varchar(100) NOT NULL,
  `aciklama` varchar(100) NOT NULL,
  `kullanici_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `elleyazi`
--

CREATE TABLE `elleyazi` (
  `ID` int(11) NOT NULL,
  `elle` varchar(100) NOT NULL,
  `acıklama` varchar(100) NOT NULL,
  `kullanici_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

CREATE TABLE `kullanici` (
  `id` int(11) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `sifre` varchar(100) NOT NULL,
  `tema_rengi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`id`, `mail`, `sifre`, `tema_rengi`) VALUES
(1, 'ela06@gmail.com', '12345', '#800040'),
(2, 'neco@gmail.com', '1234', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `notlar`
--

CREATE TABLE `notlar` (
  `ID` int(11) NOT NULL,
  `notlari` varchar(100) NOT NULL,
  `notadi` varchar(100) NOT NULL,
  `tarih` varchar(100) NOT NULL,
  `font_ailesi` varchar(100) DEFAULT 'Microsoft Sans Serif',
  `font_boyut` float DEFAULT 8.25,
  `font_stil` int(11) DEFAULT 0,
  `not_rengi` int(11) DEFAULT -16777216,
  `kullanici_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `notlar`
--

INSERT INTO `notlar` (`ID`, `notlari`, `notadi`, `tarih`, `font_ailesi`, `font_boyut`, `font_stil`, `not_rengi`, `kullanici_id`) VALUES
(26, 'deneme var her şeyde', 'son test', '2026-05-06', 'Showcard Gothic', 9, 0, -65281, 1),
(28, 'deneme var her şeyde', 'son test2', '2026-05-06', 'Tempus Sans ITC', 13.8, 0, -8355840, 1);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `alarm`
--
ALTER TABLE `alarm`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `elleyazi`
--
ALTER TABLE `elleyazi`
  ADD PRIMARY KEY (`ID`);

--
-- Tablo için indeksler `kullanici`
--
ALTER TABLE `kullanici`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `notlar`
--
ALTER TABLE `notlar`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_kullanici` (`kullanici_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `alarm`
--
ALTER TABLE `alarm`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Tablo için AUTO_INCREMENT değeri `elleyazi`
--
ALTER TABLE `elleyazi`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Tablo için AUTO_INCREMENT değeri `kullanici`
--
ALTER TABLE `kullanici`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Tablo için AUTO_INCREMENT değeri `notlar`
--
ALTER TABLE `notlar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `notlar`
--
ALTER TABLE `notlar`
  ADD CONSTRAINT `fk_kullanici` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanici` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
