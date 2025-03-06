-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Gép: localhost:8889
-- Létrehozás ideje: 2022. Ápr 15. 22:12
-- Kiszolgáló verziója: 5.7.34
-- PHP verzió: 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `teliolimpia`
--
CREATE DATABASE IF NOT EXISTS `teliolimpia` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `teliolimpia`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `magyarermesek`
--

CREATE TABLE `magyarermesek` (
  `ID` int(11) NOT NULL,
  `versenyzoID` int(11) NOT NULL,
  `neme` tinyint(1) NOT NULL,
  `helyezes` int(2) NOT NULL,
  `tavID` int(11) NOT NULL,
  `sportagID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `magyarermesek`
--

INSERT INTO `magyarermesek` (`ID`, `versenyzoID`, `neme`, `helyezes`, `tavID`, `sportagID`) VALUES
(1, 1, 1, 17, 1, 9),
(2, 1, 1, 14, 2, 9),
(3, 1, 1, 11, 3, 9),
(4, 1, 1, 6, 5, 9),
(5, 1, 1, 6, 6, 9),
(6, 2, 1, 1, 1, 9),
(7, 2, 1, 3, 2, 9),
(8, 2, 1, 4, 3, 9),
(9, 2, 1, 6, 5, 9),
(10, 2, 1, 6, 6, 9),
(11, 4, 1, 13, 1, 9),
(12, 4, 1, 6, 2, 9),
(13, 4, 1, 6, 5, 9),
(14, 4, 1, 6, 6, 9),
(15, 3, 1, 6, 5, 9),
(16, 3, 1, 6, 6, 9),
(17, 3, 0, 7, 1, 9),
(18, 5, 0, 8, 2, 9),
(19, 5, 0, 22, 3, 9),
(20, 5, 0, 3, 5, 9),
(21, 6, 0, 21, 1, 9),
(22, 6, 0, 29, 2, 9),
(23, 6, 0, 3, 5, 9);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rpgyorskorcsolyaeredmenyek`
--

CREATE TABLE `rpgyorskorcsolyaeredmenyek` (
  `helyezesID` int(11) NOT NULL,
  `helyezes` int(2) NOT NULL,
  `orszag` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `arany` int(2) NOT NULL,
  `ezust` int(2) NOT NULL,
  `bronz` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `rpgyorskorcsolyaeredmenyek`
--

INSERT INTO `rpgyorskorcsolyaeredmenyek` (`helyezesID`, `helyezes`, `orszag`, `arany`, `ezust`, `bronz`) VALUES
(1, 1, 'Dél-Korea Dél-Korea KOR)', 2, 3, 0),
(2, 2, 'Hollandia Hollandia (NED)', 2, 1, 1),
(3, 2, 'Kína ína CHN)', 2, 1, 1),
(4, 4, 'Olaszország Olaszország (ITA)', 1, 2, 1),
(5, 5, 'Kanada Kanada (CAN)', 1, 1, 2),
(6, 6, 'Magyarország Magyarország (HUN)', 1, 0, 2),
(7, 7, 'Orosz Olimpiai Bizottság (ROC)', 0, 1, 1),
(8, 8, 'Belgium Belgium (BEL)', 0, 0, 1);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rpgytavok`
--

CREATE TABLE `rpgytavok` (
  `tavID` int(11) NOT NULL,
  `tav` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `rpgytavok`
--

INSERT INTO `rpgytavok` (`tavID`, `tav`) VALUES
(2, '1000 méter'),
(3, '1500 méter'),
(4, '2000 méter'),
(5, '3000 méter váltó'),
(1, '500 méter'),
(6, '5000 méter váltó');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `sportagak`
--

CREATE TABLE `sportagak` (
  `sportagID` int(11) NOT NULL,
  `sportagneve` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `versenyszamok` int(2) NOT NULL,
  `varos` varchar(50) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL,
  `helyszin` varchar(100) CHARACTER SET utf8 COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- A tábla adatainak kiíratása `sportagak`
--

INSERT INTO `sportagak` (`sportagID`, `sportagneve`, `versenyszamok`, `varos`, `helyszin`) VALUES
(1, 'Alpesisí', 11, 'Peking', 'Hsziaohajtuo alpesisípálya'),
(2, 'Biatlon', 11, 'Csangcsiakou', 'Hualintung íközpont'),
(3, 'Bob', 4, 'Peking', 'Hsziaohajtuo bob- és szánkópályán'),
(4, 'Curling', 3, 'Peking', 'Nemzeti Vízi Központ'),
(5, 'Északi összetett', 3, 'Csangcsiakou', 'Kujangsu síközpont'),
(6, 'Gyorskorcsolya', 14, 'Peking', 'Nemzeti gyorskorcsolya-pálya'),
(7, 'Jégkorong', 2, 'Peking', 'Wukesong Arena'),
(8, 'Műkorcsolya', 5, 'Peking', 'Fővárosi Fedett Stadion'),
(9, 'Rövidpályás gyorskorcsolya', 9, 'Peking', 'Fővárosi Fedett Stadion'),
(10, 'Síakrobatika', 13, 'Peking', 'Genting Snow Parkban'),
(11, 'Sífutás', 12, 'Csangcsiakou', 'Kujangsu síközpont'),
(12, 'Síugrás', 5, 'Csangcsiakou', 'Kujangsu síközpont'),
(13, 'Snowboard', 11, 'Peking', 'Genting Snow Parkban'),
(14, 'Szánkó', 4, 'Peking', 'Hsziaohajtuo bob- és szánkópály'),
(15, 'Szkeleton', 2, 'Peking', 'Hsziaohajtuo bob- és szánkópály');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `versenyzok`
--

CREATE TABLE `versenyzok` (
  `ID` int(11) NOT NULL,
  `versenyzo` varchar(100) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `versenyzok`
--

INSERT INTO `versenyzok` (`ID`, `versenyzo`) VALUES
(1, 'Krueger John-Henry '),
(2, 'Liu Shaoang'),
(3, 'Nógrádi Bence'),
(4, 'Liu Shaolin Sándor'),
(5, 'Jászapáti Petra'),
(6, 'Kónya Zsófia');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `magyarermesek`
--
ALTER TABLE `magyarermesek`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDXsportagid` (`sportagID`) USING BTREE,
  ADD KEY `IDXtavid` (`tavID`) USING BTREE,
  ADD KEY `IDXversenyzoid` (`versenyzoID`);

--
-- A tábla indexei `rpgyorskorcsolyaeredmenyek`
--
ALTER TABLE `rpgyorskorcsolyaeredmenyek`
  ADD PRIMARY KEY (`helyezesID`),
  ADD UNIQUE KEY `IdxOrszag` (`orszag`);

--
-- A tábla indexei `rpgytavok`
--
ALTER TABLE `rpgytavok`
  ADD PRIMARY KEY (`tavID`),
  ADD UNIQUE KEY `Idxtav` (`tav`);

--
-- A tábla indexei `sportagak`
--
ALTER TABLE `sportagak`
  ADD PRIMARY KEY (`sportagID`),
  ADD UNIQUE KEY `IdxSportag` (`sportagneve`);

--
-- A tábla indexei `versenyzok`
--
ALTER TABLE `versenyzok`
  ADD PRIMARY KEY (`ID`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `versenyzok`
--
ALTER TABLE `versenyzok`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `magyarermesek`
--
ALTER TABLE `magyarermesek`
  ADD CONSTRAINT `magyarermesek_ibfk_1` FOREIGN KEY (`tavID`) REFERENCES `rpgytavok` (`tavID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `magyarermesek_ibfk_2` FOREIGN KEY (`sportagID`) REFERENCES `sportagak` (`sportagID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `magyarermesek_ibfk_3` FOREIGN KEY (`versenyzoID`) REFERENCES `versenyzok` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
