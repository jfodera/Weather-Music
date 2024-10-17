-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 04, 2024 at 11:30 PM
-- Server version: 10.11.8-MariaDB-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `apiDat`
--

-- --------------------------------------------------------

--
-- Table structure for table `jsonObjs`
--

CREATE TABLE `jsonObjs` (
  `callId` int(10) UNSIGNED NOT NULL,
  `apiType` char(40) NOT NULL,
  `jdoc` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`jdoc`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jsonObjs`
--

INSERT INTO `jsonObjs` (`callId`, `apiType`, `jdoc`) VALUES
(213, 'misc', '{\"coord\":{\"lon\":-73.6918,\"lat\":42.7284},\"weather\":[{\"id\":804,\"main\":\"Clouds\",\"description\":\"overcast clouds\",\"icon\":\"04d\"}],\"base\":\"stations\",\"main\":{\"temp\":70.86,\"feels_like\":70.84,\"temp_min\":68,\"temp_max\":72.68,\"pressure\":1020,\"humidity\":68,\"sea_level\":1020,\"grnd_level\":1006},\"visibility\":10000,\"wind\":{\"speed\":1.01,\"deg\":199,\"gust\":1.99},\"clouds\":{\"all\":100},\"dt\":1728078586,\"sys\":{\"type\":2,\"id\":2018860,\"country\":\"US\",\"sunrise\":1728039341,\"sunset\":1728081044},\"timezone\":-14400,\"id\":5141502,\"name\":\"Troy\",\"cod\":200}'),
(214, 'misc', '{\"playlists\":{\"href\":\"https://api.spotify.com/v1/search?query=Clear+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=0&limit=5\",\"items\":[{\"collaborative\":false,\"description\":\"On this day, I see clearly.\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/60yUC3ofCIJFPS8fVhsRlx\"},\"href\":\"https://api.spotify.com/v1/playlists/60yUC3ofCIJFPS8fVhsRlx\",\"id\":\"60yUC3ofCIJFPS8fVhsRlx\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb10af7283efc35f1f33e0aab3\",\"width\":null}],\"name\":\"You think you know me...\",\"owner\":{\"display_name\":\"Matthew\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/0h02wnvkesfx9p68e8bvq3rpy\"},\"href\":\"https://api.spotify.com/v1/users/0h02wnvkesfx9p68e8bvq3rpy\",\"id\":\"0h02wnvkesfx9p68e8bvq3rpy\",\"type\":\"user\",\"uri\":\"spotify:user:0h02wnvkesfx9p68e8bvq3rpy\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MzAsNzQ3OTIwNmIyMTAyNzU1MDQ0NDIyOGUxMjk0NzUxOTUzMTBkOTg2NA==\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/60yUC3ofCIJFPS8fVhsRlx/tracks\",\"total\":27},\"type\":\"playlist\",\"uri\":\"spotify:playlist:60yUC3ofCIJFPS8fVhsRlx\"},{\"collaborative\":false,\"description\":\"With Money Man, Babyface Ray, Finesse2tymes and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/37i9dQZF1E8OT68Kl6Ui0m\"},\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8OT68Kl6Ui0m\",\"id\":\"37i9dQZF1E8OT68Kl6Ui0m\",\"images\":[{\"height\":null,\"url\":\"https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/track/4ste8AYlMCkqeW5U4HgQcl/en\",\"width\":null}],\"name\":\"Clear Radio\",\"owner\":{\"display_name\":\"Spotify\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/spotify\"},\"href\":\"https://api.spotify.com/v1/users/spotify\",\"id\":\"spotify\",\"type\":\"user\",\"uri\":\"spotify:user:spotify\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTcyODA3ODQ5NCwwMDAwMDAwMGQzNTE0YWQ2NDk0YmM2MWRhNmViZTRjYjdmZjdlNTNm\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8OT68Kl6Ui0m/tracks\",\"total\":50},\"type\":\"playlist\",\"uri\":\"spotify:playlist:37i9dQZF1E8OT68Kl6Ui0m\"},{\"collaborative\":false,\"description\":\"Embracing the beauty of crystal-clear lake days, conquering trails in Glacier National Park, and sharing laughter with the best people we know. These are the moments that truly define a Montana summer\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/1Te0kv5XTzKQPxACTm1O3n\"},\"href\":\"https://api.spotify.com/v1/playlists/1Te0kv5XTzKQPxACTm1O3n\",\"id\":\"1Te0kv5XTzKQPxACTm1O3n\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb5997ab440bd52c32e72e42df\",\"width\":null}],\"name\":\"Montana Summer 2024\",\"owner\":{\"display_name\":\"jdhoppes\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/jdhoppes\"},\"href\":\"https://api.spotify.com/v1/users/jdhoppes\",\"id\":\"jdhoppes\",\"type\":\"user\",\"uri\":\"spotify:user:jdhoppes\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MzY5LGVmM2U5ZDgzZTQyZDQzY2EzMTMzMjc2MWM4OGQ4NjQ0MjZlNzNlMjM=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/1Te0kv5XTzKQPxACTm1O3n/tracks\",\"total\":334},\"type\":\"playlist\",\"uri\":\"spotify:playlist:1Te0kv5XTzKQPxACTm1O3n\"},{\"collaborative\":false,\"description\":\"With FINNEAS, Ashe, ROLE MODEL and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/37i9dQZF1E8NxzO61q4fHD\"},\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8NxzO61q4fHD\",\"id\":\"37i9dQZF1E8NxzO61q4fHD\",\"images\":[{\"height\":null,\"url\":\"https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/track/7HWONeQrWpcjflAPGbH5L3/en\",\"width\":null}],\"name\":\"Cleats Radio\",\"owner\":{\"display_name\":\"Spotify\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/spotify\"},\"href\":\"https://api.spotify.com/v1/users/spotify\",\"id\":\"spotify\",\"type\":\"user\",\"uri\":\"spotify:user:spotify\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTcyODA3ODQ5NCwwMDAwMDAwMDU0MTQzOGYyYjZkZjQzYzA4NzMwMDFjODg2NGYwNjRi\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8NxzO61q4fHD/tracks\",\"total\":50},\"type\":\"playlist\",\"uri\":\"spotify:playlist:37i9dQZF1E8NxzO61q4fHD\"},{\"collaborative\":false,\"description\":\"Imagine a summer day, the aroma of a burning grill and the sight of a clear summer sky. You’re sitting down in your favorite lawn chair with a perspirating beer in hand. Sink in, kick your feet up and enjoy the vibes.\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/0sjzfNwiVqTjUrAEXNb5FO\"},\"href\":\"https://api.spotify.com/v1/playlists/0sjzfNwiVqTjUrAEXNb5FO\",\"id\":\"0sjzfNwiVqTjUrAEXNb5FO\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb0d187d4e3c9e94d15fd6828c\",\"width\":null}],\"name\":\"Beer Garden Pub Mix\",\"owner\":{\"display_name\":\"Nick Albert\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/1269756818\"},\"href\":\"https://api.spotify.com/v1/users/1269756818\",\"id\":\"1269756818\",\"type\":\"user\",\"uri\":\"spotify:user:1269756818\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTM2LDFkYzNmMTM2MGZjNTdiMzE4ZjdjODZjNjBhMDliNmNhMWMxYjA3ZTk=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/0sjzfNwiVqTjUrAEXNb5FO/tracks\",\"total\":108},\"type\":\"playlist\",\"uri\":\"spotify:playlist:0sjzfNwiVqTjUrAEXNb5FO\"}],\"limit\":5,\"next\":\"https://api.spotify.com/v1/search?query=Clear+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=5\",\"offset\":0,\"previous\":null,\"total\":1000}}'),
(215, 'misc', '{\"coord\":{\"lon\":-82.8374,\"lat\":34.6834},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01d\"}],\"base\":\"stations\",\"main\":{\"temp\":76.66,\"feels_like\":77.74,\"temp_min\":74.32,\"temp_max\":78.84,\"pressure\":1020,\"humidity\":79,\"sea_level\":1020,\"grnd_level\":992},\"visibility\":10000,\"wind\":{\"speed\":0,\"deg\":0},\"clouds\":{\"all\":0},\"dt\":1728081100,\"sys\":{\"type\":2,\"id\":2032100,\"country\":\"US\",\"sunrise\":1728041310,\"sunset\":1728083464},\"timezone\":-14400,\"id\":4574989,\"name\":\"Clemson\",\"cod\":200}'),
(216, 'misc', '{\"playlists\":{\"href\":\"https://api.spotify.com/v1/search?query=Clouds+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=0&limit=5\",\"items\":[{\"collaborative\":false,\"description\":\"Another Brick in The Wall, Burning Bridges, Coming Back To Life, Cymbaline, High Hopes, Obscured By Clouds, One Of These Days, One Slip, Shine On You Crazy Diamond, Signs Of Life, Sorrow, Take It Back, Terminal Frost, Welcome To The Machine, Whish You Were Here, Your Possible Pasts...\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/7IddiFVjAJbTLniq82Vusj\"},\"href\":\"https://api.spotify.com/v1/playlists/7IddiFVjAJbTLniq82Vusj\",\"id\":\"7IddiFVjAJbTLniq82Vusj\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebbf91b7c659769c6bd31b7eda4\",\"width\":null}],\"name\":\"Pink Floyd - Best Of\",\"owner\":{\"display_name\":\"Overblast\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/6wuszat8f5im40z58i8ixnu7o\"},\"href\":\"https://api.spotify.com/v1/users/6wuszat8f5im40z58i8ixnu7o\",\"id\":\"6wuszat8f5im40z58i8ixnu7o\",\"type\":\"user\",\"uri\":\"spotify:user:6wuszat8f5im40z58i8ixnu7o\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTUzLDRhMDI2OTEyMDhiODRmY2YzZmJjZjhmZGI1YWU2OWY4MDY3NDA0OTQ=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/7IddiFVjAJbTLniq82Vusj/tracks\",\"total\":48},\"type\":\"playlist\",\"uri\":\"spotify:playlist:7IddiFVjAJbTLniq82Vusj\"},{\"collaborative\":false,\"description\":\"With BUNT., Lavern, Fred again.. and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/37i9dQZF1E8NpwAo5dWxFG\"},\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8NpwAo5dWxFG\",\"id\":\"37i9dQZF1E8NpwAo5dWxFG\",\"images\":[{\"height\":null,\"url\":\"https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/track/3zPco1u9i9bCjkG5pngR5t/en\",\"width\":null}],\"name\":\"Clouds Radio\",\"owner\":{\"display_name\":\"Spotify\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/spotify\"},\"href\":\"https://api.spotify.com/v1/users/spotify\",\"id\":\"spotify\",\"type\":\"user\",\"uri\":\"spotify:user:spotify\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTcyODA3ODQ4OCwwMDAwMDAwMGE0MjYyZDcwMTQ3OWMzNTc2YjIyYTFhM2Y1ZTExYmJi\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8NpwAo5dWxFG/tracks\",\"total\":50},\"type\":\"playlist\",\"uri\":\"spotify:playlist:37i9dQZF1E8NpwAo5dWxFG\"},{\"collaborative\":false,\"description\":\"Kids songs for rainy days when you&#x27;re stuck inside. Songs include It&#x27;s Raining It&#x27;s Pouring, Rain Rain Go Away, Raindrops Keep Falling on my Head, Itsy Bitsy Spider. Feauting children&#x27;s music artist like The Wiggles, Peppa Pig, Kiboomers, Laurie Berkner, Bounce Patrol, Play School and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/1NxZyaGcTLcGdT7DVFTP24\"},\"href\":\"https://api.spotify.com/v1/playlists/1NxZyaGcTLcGdT7DVFTP24\",\"id\":\"1NxZyaGcTLcGdT7DVFTP24\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb1c4572399db7e7d28d7a9316\",\"width\":null}],\"name\":\"Rainy Days ☂️ Kids Songs about rain, clouds and puddles\",\"owner\":{\"display_name\":\"Bounce Patrol\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/j09gqx2gl654bs6facuy8ijuv\"},\"href\":\"https://api.spotify.com/v1/users/j09gqx2gl654bs6facuy8ijuv\",\"id\":\"j09gqx2gl654bs6facuy8ijuv\",\"type\":\"user\",\"uri\":\"spotify:user:j09gqx2gl654bs6facuy8ijuv\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTQzLGY2YWQ1ZWIzNzc5NjUwODEzYzhjYzIyNzk3YzdhMGM3ZDRlNjM3Zjg=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/1NxZyaGcTLcGdT7DVFTP24/tracks\",\"total\":74},\"type\":\"playlist\",\"uri\":\"spotify:playlist:1NxZyaGcTLcGdT7DVFTP24\"},{\"collaborative\":false,\"description\":\"Relax, meditate, and enjoy the tranquility! hansonlvanov589@gmail.com\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/14BHKO8v5hgaXVwDm5cVwZ\"},\"href\":\"https://api.spotify.com/v1/playlists/14BHKO8v5hgaXVwDm5cVwZ\",\"id\":\"14BHKO8v5hgaXVwDm5cVwZ\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-fa.spotifycdn.com/image/ab67706c0000bebbdeeff1ae231e93970b2987ff\",\"width\":null}],\"name\":\"In the clouds\",\"owner\":{\"display_name\":\"hanson_Ivanov\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/31ra6qhicf4xza7hg4bjzwkdzm74\"},\"href\":\"https://api.spotify.com/v1/users/31ra6qhicf4xza7hg4bjzwkdzm74\",\"id\":\"31ra6qhicf4xza7hg4bjzwkdzm74\",\"type\":\"user\",\"uri\":\"spotify:user:31ra6qhicf4xza7hg4bjzwkdzm74\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"ODksYWMwMTI2NDRiMmRmMjM3MDE0NjRkMWY3YjdiMTQ5MDEyZmNkYzVkYw==\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/14BHKO8v5hgaXVwDm5cVwZ/tracks\",\"total\":42},\"type\":\"playlist\",\"uri\":\"spotify:playlist:14BHKO8v5hgaXVwDm5cVwZ\"},{\"collaborative\":false,\"description\":\"It&#x27;s a beautiful day outside! Classical music for your perfect day. Blue skies, gentle breeze, little white clouds, green grasses, colourful flowers, chirping birds &amp; shady trees.\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/4Si2Apa6JTtU03o4MqHHAk\"},\"href\":\"https://api.spotify.com/v1/playlists/4Si2Apa6JTtU03o4MqHHAk\",\"id\":\"4Si2Apa6JTtU03o4MqHHAk\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb57cb9d67335aef0f3c1f49be\",\"width\":null}],\"name\":\"Sunny & Bright Classical\",\"owner\":{\"display_name\":\"Alexander C\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/swarmnet\"},\"href\":\"https://api.spotify.com/v1/users/swarmnet\",\"id\":\"swarmnet\",\"type\":\"user\",\"uri\":\"spotify:user:swarmnet\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTEzMiwwZWJjYmQ5ZmFiOTQ4NTEwMzI4YmRkYjYyNjUwZWEzY2FlODJkMTRm\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/4Si2Apa6JTtU03o4MqHHAk/tracks\",\"total\":1009},\"type\":\"playlist\",\"uri\":\"spotify:playlist:4Si2Apa6JTtU03o4MqHHAk\"}],\"limit\":5,\"next\":\"https://api.spotify.com/v1/search?query=Clouds+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=5\",\"offset\":0,\"previous\":null,\"total\":1000}}'),
(217, 'misc', '{\"coord\":{\"lon\":-82.84,\"lat\":34.68},\"weather\":[{\"id\":800,\"main\":\"Clear\",\"description\":\"clear sky\",\"icon\":\"01n\"}],\"base\":\"stations\",\"main\":{\"temp\":73.67,\"feels_like\":74.73,\"temp_min\":71.92,\"temp_max\":74.82,\"pressure\":1020,\"humidity\":85,\"sea_level\":1020,\"grnd_level\":992},\"visibility\":10000,\"wind\":{\"speed\":0,\"deg\":0},\"clouds\":{\"all\":0},\"dt\":1728083923,\"sys\":{\"type\":1,\"id\":3596,\"country\":\"US\",\"sunrise\":1728041310,\"sunset\":1728083465},\"timezone\":-14400,\"id\":4574989,\"name\":\"Clemson\",\"cod\":200}'),
(218, 'misc', '{\"playlists\":{\"href\":\"https://api.spotify.com/v1/search?query=Clear+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=0&limit=5\",\"items\":[{\"collaborative\":false,\"description\":\"On this day, I see clearly.\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/60yUC3ofCIJFPS8fVhsRlx\"},\"href\":\"https://api.spotify.com/v1/playlists/60yUC3ofCIJFPS8fVhsRlx\",\"id\":\"60yUC3ofCIJFPS8fVhsRlx\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb10af7283efc35f1f33e0aab3\",\"width\":null}],\"name\":\"You think you know me...\",\"owner\":{\"display_name\":\"Matthew\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/0h02wnvkesfx9p68e8bvq3rpy\"},\"href\":\"https://api.spotify.com/v1/users/0h02wnvkesfx9p68e8bvq3rpy\",\"id\":\"0h02wnvkesfx9p68e8bvq3rpy\",\"type\":\"user\",\"uri\":\"spotify:user:0h02wnvkesfx9p68e8bvq3rpy\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MzAsNzQ3OTIwNmIyMTAyNzU1MDQ0NDIyOGUxMjk0NzUxOTUzMTBkOTg2NA==\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/60yUC3ofCIJFPS8fVhsRlx/tracks\",\"total\":27},\"type\":\"playlist\",\"uri\":\"spotify:playlist:60yUC3ofCIJFPS8fVhsRlx\"},{\"collaborative\":false,\"description\":\"\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/4Qu4duUWRdVBCdwLsZ8HCr\"},\"href\":\"https://api.spotify.com/v1/playlists/4Qu4duUWRdVBCdwLsZ8HCr\",\"id\":\"4Qu4duUWRdVBCdwLsZ8HCr\",\"images\":[{\"height\":640,\"url\":\"https://mosaic.scdn.co/640/ab67616d0000b2735dd44bf0a252e30d4bb2e7c8ab67616d0000b27362d124c1fe1b7ce4ab2a92bfab67616d0000b273f7d3ba2473d4452b83ba61c4ab67616d0000b273fd2df253c4f816162dfe1170\",\"width\":640},{\"height\":300,\"url\":\"https://mosaic.scdn.co/300/ab67616d0000b2735dd44bf0a252e30d4bb2e7c8ab67616d0000b27362d124c1fe1b7ce4ab2a92bfab67616d0000b273f7d3ba2473d4452b83ba61c4ab67616d0000b273fd2df253c4f816162dfe1170\",\"width\":300},{\"height\":60,\"url\":\"https://mosaic.scdn.co/60/ab67616d0000b2735dd44bf0a252e30d4bb2e7c8ab67616d0000b27362d124c1fe1b7ce4ab2a92bfab67616d0000b273f7d3ba2473d4452b83ba61c4ab67616d0000b273fd2df253c4f816162dfe1170\",\"width\":60}],\"name\":\"Clear day\",\"owner\":{\"display_name\":\"Thomas Yarbrough\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/1290775700\"},\"href\":\"https://api.spotify.com/v1/users/1290775700\",\"id\":\"1290775700\",\"type\":\"user\",\"uri\":\"spotify:user:1290775700\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"NTgzLGRjNTEyYzc2Mjc2MGZkOTdkMjI1YWRiODg0MDE1MTVlOWM3NmFhNDE=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/4Qu4duUWRdVBCdwLsZ8HCr/tracks\",\"total\":508},\"type\":\"playlist\",\"uri\":\"spotify:playlist:4Qu4duUWRdVBCdwLsZ8HCr\"},{\"collaborative\":false,\"description\":\"Embracing the beauty of crystal-clear lake days, conquering trails in Glacier National Park, and sharing laughter with the best people we know. These are the moments that truly define a Montana summer\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/1Te0kv5XTzKQPxACTm1O3n\"},\"href\":\"https://api.spotify.com/v1/playlists/1Te0kv5XTzKQPxACTm1O3n\",\"id\":\"1Te0kv5XTzKQPxACTm1O3n\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb5997ab440bd52c32e72e42df\",\"width\":null}],\"name\":\"Montana Summer 2024\",\"owner\":{\"display_name\":\"jdhoppes\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/jdhoppes\"},\"href\":\"https://api.spotify.com/v1/users/jdhoppes\",\"id\":\"jdhoppes\",\"type\":\"user\",\"uri\":\"spotify:user:jdhoppes\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MzY5LGVmM2U5ZDgzZTQyZDQzY2EzMTMzMjc2MWM4OGQ4NjQ0MjZlNzNlMjM=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/1Te0kv5XTzKQPxACTm1O3n/tracks\",\"total\":334},\"type\":\"playlist\",\"uri\":\"spotify:playlist:1Te0kv5XTzKQPxACTm1O3n\"},{\"collaborative\":false,\"description\":\"With Money Man, Babyface Ray, Finesse2tymes and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/37i9dQZF1E8OT68Kl6Ui0m\"},\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8OT68Kl6Ui0m\",\"id\":\"37i9dQZF1E8OT68Kl6Ui0m\",\"images\":[{\"height\":null,\"url\":\"https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/track/4ste8AYlMCkqeW5U4HgQcl/en\",\"width\":null}],\"name\":\"Clear Radio\",\"owner\":{\"display_name\":\"Spotify\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/spotify\"},\"href\":\"https://api.spotify.com/v1/users/spotify\",\"id\":\"spotify\",\"type\":\"user\",\"uri\":\"spotify:user:spotify\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTcyODA4NDExNCwwMDAwMDAwMDJiYWI1YTM3Y2ZhNDQ1YTBhMjcwZDZjYTVlODZiMTlh\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8OT68Kl6Ui0m/tracks\",\"total\":50},\"type\":\"playlist\",\"uri\":\"spotify:playlist:37i9dQZF1E8OT68Kl6Ui0m\"},{\"collaborative\":false,\"description\":\"Imagine a summer day, the aroma of a burning grill and the sight of a clear summer sky. You’re sitting down in your favorite lawn chair with a perspirating beer in hand. Sink in, kick your feet up and enjoy the vibes.\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/0sjzfNwiVqTjUrAEXNb5FO\"},\"href\":\"https://api.spotify.com/v1/playlists/0sjzfNwiVqTjUrAEXNb5FO\",\"id\":\"0sjzfNwiVqTjUrAEXNb5FO\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb0d187d4e3c9e94d15fd6828c\",\"width\":null}],\"name\":\"Beer Garden Pub Mix\",\"owner\":{\"display_name\":\"Nick Albert\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/1269756818\"},\"href\":\"https://api.spotify.com/v1/users/1269756818\",\"id\":\"1269756818\",\"type\":\"user\",\"uri\":\"spotify:user:1269756818\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTM2LDFkYzNmMTM2MGZjNTdiMzE4ZjdjODZjNjBhMDliNmNhMWMxYjA3ZTk=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/0sjzfNwiVqTjUrAEXNb5FO/tracks\",\"total\":108},\"type\":\"playlist\",\"uri\":\"spotify:playlist:0sjzfNwiVqTjUrAEXNb5FO\"}],\"limit\":5,\"next\":\"https://api.spotify.com/v1/search?query=Clear+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=5\",\"offset\":0,\"previous\":null,\"total\":1000}}'),
(219, 'misc', '{\"coord\":{\"lon\":-73.6876,\"lat\":42.7281},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":62.96,\"feels_like\":62.82,\"temp_min\":61.16,\"temp_max\":65.64,\"pressure\":1020,\"humidity\":82,\"sea_level\":1020,\"grnd_level\":1004},\"visibility\":10000,\"wind\":{\"speed\":1.01,\"deg\":133,\"gust\":1.01},\"clouds\":{\"all\":75},\"dt\":1728084140,\"sys\":{\"type\":2,\"id\":2018860,\"country\":\"US\",\"sunrise\":1728039340,\"sunset\":1728081043},\"timezone\":-14400,\"id\":5141502,\"name\":\"Troy\",\"cod\":200}'),
(220, 'misc', '{\"playlists\":{\"href\":\"https://api.spotify.com/v1/search?query=Clouds+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=0&limit=5\",\"items\":[{\"collaborative\":false,\"description\":\"Another Brick in The Wall, Burning Bridges, Coming Back To Life, Cymbaline, High Hopes, Obscured By Clouds, One Of These Days, One Slip, Shine On You Crazy Diamond, Signs Of Life, Sorrow, Take It Back, Terminal Frost, Welcome To The Machine, Whish You Were Here, Your Possible Pasts...\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/7IddiFVjAJbTLniq82Vusj\"},\"href\":\"https://api.spotify.com/v1/playlists/7IddiFVjAJbTLniq82Vusj\",\"id\":\"7IddiFVjAJbTLniq82Vusj\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebbf91b7c659769c6bd31b7eda4\",\"width\":null}],\"name\":\"Pink Floyd - Best Of\",\"owner\":{\"display_name\":\"Overblast\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/6wuszat8f5im40z58i8ixnu7o\"},\"href\":\"https://api.spotify.com/v1/users/6wuszat8f5im40z58i8ixnu7o\",\"id\":\"6wuszat8f5im40z58i8ixnu7o\",\"type\":\"user\",\"uri\":\"spotify:user:6wuszat8f5im40z58i8ixnu7o\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTUzLDRhMDI2OTEyMDhiODRmY2YzZmJjZjhmZGI1YWU2OWY4MDY3NDA0OTQ=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/7IddiFVjAJbTLniq82Vusj/tracks\",\"total\":48},\"type\":\"playlist\",\"uri\":\"spotify:playlist:7IddiFVjAJbTLniq82Vusj\"},{\"collaborative\":false,\"description\":\"With BUNT., Lavern, Fred again.. and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/37i9dQZF1E8NpwAo5dWxFG\"},\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8NpwAo5dWxFG\",\"id\":\"37i9dQZF1E8NpwAo5dWxFG\",\"images\":[{\"height\":null,\"url\":\"https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/track/3zPco1u9i9bCjkG5pngR5t/en\",\"width\":null}],\"name\":\"Clouds Radio\",\"owner\":{\"display_name\":\"Spotify\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/spotify\"},\"href\":\"https://api.spotify.com/v1/users/spotify\",\"id\":\"spotify\",\"type\":\"user\",\"uri\":\"spotify:user:spotify\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTcyODA4NDExMCwwMDAwMDAwMDkyZGNjNDc2MjY3ODk1MmJlMjUyMDA2OWI1YzAxZmY3\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8NpwAo5dWxFG/tracks\",\"total\":50},\"type\":\"playlist\",\"uri\":\"spotify:playlist:37i9dQZF1E8NpwAo5dWxFG\"},{\"collaborative\":false,\"description\":\"Kids songs for rainy days when you&#x27;re stuck inside. Songs include It&#x27;s Raining It&#x27;s Pouring, Rain Rain Go Away, Raindrops Keep Falling on my Head, Itsy Bitsy Spider. Feauting children&#x27;s music artist like The Wiggles, Peppa Pig, Kiboomers, Laurie Berkner, Bounce Patrol, Play School and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/1NxZyaGcTLcGdT7DVFTP24\"},\"href\":\"https://api.spotify.com/v1/playlists/1NxZyaGcTLcGdT7DVFTP24\",\"id\":\"1NxZyaGcTLcGdT7DVFTP24\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-fa.spotifycdn.com/image/ab67706c0000bebb1c4572399db7e7d28d7a9316\",\"width\":null}],\"name\":\"Rainy Days ☂️ Kids Songs about rain, clouds and puddles\",\"owner\":{\"display_name\":\"Bounce Patrol\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/j09gqx2gl654bs6facuy8ijuv\"},\"href\":\"https://api.spotify.com/v1/users/j09gqx2gl654bs6facuy8ijuv\",\"id\":\"j09gqx2gl654bs6facuy8ijuv\",\"type\":\"user\",\"uri\":\"spotify:user:j09gqx2gl654bs6facuy8ijuv\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTQzLGY2YWQ1ZWIzNzc5NjUwODEzYzhjYzIyNzk3YzdhMGM3ZDRlNjM3Zjg=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/1NxZyaGcTLcGdT7DVFTP24/tracks\",\"total\":74},\"type\":\"playlist\",\"uri\":\"spotify:playlist:1NxZyaGcTLcGdT7DVFTP24\"},{\"collaborative\":false,\"description\":\"With $uicideboy$, Xavier Wulf, Scrim and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/37i9dQZF1E8LKCnD2qI7YH\"},\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8LKCnD2qI7YH\",\"id\":\"37i9dQZF1E8LKCnD2qI7YH\",\"images\":[{\"height\":null,\"url\":\"https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/track/7s7q9dpsSCMEnDR3WhExZy/en\",\"width\":null}],\"name\":\"Clouds as Witnesses Radio\",\"owner\":{\"display_name\":\"Spotify\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/spotify\"},\"href\":\"https://api.spotify.com/v1/users/spotify\",\"id\":\"spotify\",\"type\":\"user\",\"uri\":\"spotify:user:spotify\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTcyODA4NDExMCwwMDAwMDAwMDgxN2I4NWU3NmFmZTUzODgyMjRiZDRhMGZmMDVhYWQ2\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8LKCnD2qI7YH/tracks\",\"total\":50},\"type\":\"playlist\",\"uri\":\"spotify:playlist:37i9dQZF1E8LKCnD2qI7YH\"},{\"collaborative\":false,\"description\":\"It&#x27;s a beautiful day outside! Classical music for your perfect day. Blue skies, gentle breeze, little white clouds, green grasses, colourful flowers, chirping birds &amp; shady trees.\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/4Si2Apa6JTtU03o4MqHHAk\"},\"href\":\"https://api.spotify.com/v1/playlists/4Si2Apa6JTtU03o4MqHHAk\",\"id\":\"4Si2Apa6JTtU03o4MqHHAk\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb57cb9d67335aef0f3c1f49be\",\"width\":null}],\"name\":\"Sunny & Bright Classical\",\"owner\":{\"display_name\":\"Alexander C\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/swarmnet\"},\"href\":\"https://api.spotify.com/v1/users/swarmnet\",\"id\":\"swarmnet\",\"type\":\"user\",\"uri\":\"spotify:user:swarmnet\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTEzMiwwZWJjYmQ5ZmFiOTQ4NTEwMzI4YmRkYjYyNjUwZWEzY2FlODJkMTRm\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/4Si2Apa6JTtU03o4MqHHAk/tracks\",\"total\":1009},\"type\":\"playlist\",\"uri\":\"spotify:playlist:4Si2Apa6JTtU03o4MqHHAk\"}],\"limit\":5,\"next\":\"https://api.spotify.com/v1/search?query=Clouds+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=5\",\"offset\":0,\"previous\":null,\"total\":1000}}'),
(221, 'misc', '{\"coord\":{\"lon\":-73.6876,\"lat\":42.7281},\"weather\":[{\"id\":803,\"main\":\"Clouds\",\"description\":\"broken clouds\",\"icon\":\"04n\"}],\"base\":\"stations\",\"main\":{\"temp\":63.19,\"feels_like\":63.07,\"temp_min\":61.36,\"temp_max\":65.64,\"pressure\":1020,\"humidity\":82,\"sea_level\":1020,\"grnd_level\":1004},\"visibility\":10000,\"wind\":{\"speed\":1.01,\"deg\":133,\"gust\":1.01},\"clouds\":{\"all\":75},\"dt\":1728083888,\"sys\":{\"type\":2,\"id\":2018860,\"country\":\"US\",\"sunrise\":1728039340,\"sunset\":1728081043},\"timezone\":-14400,\"id\":5141502,\"name\":\"Troy\",\"cod\":200}'),
(222, 'misc', '{\"playlists\":{\"href\":\"https://api.spotify.com/v1/search?query=Clouds+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=0&limit=5\",\"items\":[{\"collaborative\":false,\"description\":\"Another Brick in The Wall, Burning Bridges, Coming Back To Life, Cymbaline, High Hopes, Obscured By Clouds, One Of These Days, One Slip, Shine On You Crazy Diamond, Signs Of Life, Sorrow, Take It Back, Terminal Frost, Welcome To The Machine, Whish You Were Here, Your Possible Pasts...\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/7IddiFVjAJbTLniq82Vusj\"},\"href\":\"https://api.spotify.com/v1/playlists/7IddiFVjAJbTLniq82Vusj\",\"id\":\"7IddiFVjAJbTLniq82Vusj\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebbf91b7c659769c6bd31b7eda4\",\"width\":null}],\"name\":\"Pink Floyd - Best Of\",\"owner\":{\"display_name\":\"Overblast\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/6wuszat8f5im40z58i8ixnu7o\"},\"href\":\"https://api.spotify.com/v1/users/6wuszat8f5im40z58i8ixnu7o\",\"id\":\"6wuszat8f5im40z58i8ixnu7o\",\"type\":\"user\",\"uri\":\"spotify:user:6wuszat8f5im40z58i8ixnu7o\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTUzLDRhMDI2OTEyMDhiODRmY2YzZmJjZjhmZGI1YWU2OWY4MDY3NDA0OTQ=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/7IddiFVjAJbTLniq82Vusj/tracks\",\"total\":48},\"type\":\"playlist\",\"uri\":\"spotify:playlist:7IddiFVjAJbTLniq82Vusj\"},{\"collaborative\":false,\"description\":\"With BUNT., Lavern, Fred again.. and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/37i9dQZF1E8NpwAo5dWxFG\"},\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8NpwAo5dWxFG\",\"id\":\"37i9dQZF1E8NpwAo5dWxFG\",\"images\":[{\"height\":null,\"url\":\"https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/track/3zPco1u9i9bCjkG5pngR5t/en\",\"width\":null}],\"name\":\"Clouds Radio\",\"owner\":{\"display_name\":\"Spotify\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/spotify\"},\"href\":\"https://api.spotify.com/v1/users/spotify\",\"id\":\"spotify\",\"type\":\"user\",\"uri\":\"spotify:user:spotify\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTcyODA4NDExMCwwMDAwMDAwMDkyZGNjNDc2MjY3ODk1MmJlMjUyMDA2OWI1YzAxZmY3\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8NpwAo5dWxFG/tracks\",\"total\":50},\"type\":\"playlist\",\"uri\":\"spotify:playlist:37i9dQZF1E8NpwAo5dWxFG\"},{\"collaborative\":false,\"description\":\"Kids songs for rainy days when you&#x27;re stuck inside. Songs include It&#x27;s Raining It&#x27;s Pouring, Rain Rain Go Away, Raindrops Keep Falling on my Head, Itsy Bitsy Spider. Feauting children&#x27;s music artist like The Wiggles, Peppa Pig, Kiboomers, Laurie Berkner, Bounce Patrol, Play School and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/1NxZyaGcTLcGdT7DVFTP24\"},\"href\":\"https://api.spotify.com/v1/playlists/1NxZyaGcTLcGdT7DVFTP24\",\"id\":\"1NxZyaGcTLcGdT7DVFTP24\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-fa.spotifycdn.com/image/ab67706c0000bebb1c4572399db7e7d28d7a9316\",\"width\":null}],\"name\":\"Rainy Days ☂️ Kids Songs about rain, clouds and puddles\",\"owner\":{\"display_name\":\"Bounce Patrol\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/j09gqx2gl654bs6facuy8ijuv\"},\"href\":\"https://api.spotify.com/v1/users/j09gqx2gl654bs6facuy8ijuv\",\"id\":\"j09gqx2gl654bs6facuy8ijuv\",\"type\":\"user\",\"uri\":\"spotify:user:j09gqx2gl654bs6facuy8ijuv\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTQzLGY2YWQ1ZWIzNzc5NjUwODEzYzhjYzIyNzk3YzdhMGM3ZDRlNjM3Zjg=\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/1NxZyaGcTLcGdT7DVFTP24/tracks\",\"total\":74},\"type\":\"playlist\",\"uri\":\"spotify:playlist:1NxZyaGcTLcGdT7DVFTP24\"},{\"collaborative\":false,\"description\":\"With $uicideboy$, Xavier Wulf, Scrim and more\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/37i9dQZF1E8LKCnD2qI7YH\"},\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8LKCnD2qI7YH\",\"id\":\"37i9dQZF1E8LKCnD2qI7YH\",\"images\":[{\"height\":null,\"url\":\"https://pickasso.spotifycdn.com/image/ab67c0de0000deef/dt/v1/img/radio/track/7s7q9dpsSCMEnDR3WhExZy/en\",\"width\":null}],\"name\":\"Clouds as Witnesses Radio\",\"owner\":{\"display_name\":\"Spotify\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/spotify\"},\"href\":\"https://api.spotify.com/v1/users/spotify\",\"id\":\"spotify\",\"type\":\"user\",\"uri\":\"spotify:user:spotify\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTcyODA4NDExMCwwMDAwMDAwMDgxN2I4NWU3NmFmZTUzODgyMjRiZDRhMGZmMDVhYWQ2\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/37i9dQZF1E8LKCnD2qI7YH/tracks\",\"total\":50},\"type\":\"playlist\",\"uri\":\"spotify:playlist:37i9dQZF1E8LKCnD2qI7YH\"},{\"collaborative\":false,\"description\":\"It&#x27;s a beautiful day outside! Classical music for your perfect day. Blue skies, gentle breeze, little white clouds, green grasses, colourful flowers, chirping birds &amp; shady trees.\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/playlist/4Si2Apa6JTtU03o4MqHHAk\"},\"href\":\"https://api.spotify.com/v1/playlists/4Si2Apa6JTtU03o4MqHHAk\",\"id\":\"4Si2Apa6JTtU03o4MqHHAk\",\"images\":[{\"height\":null,\"url\":\"https://image-cdn-ak.spotifycdn.com/image/ab67706c0000bebb57cb9d67335aef0f3c1f49be\",\"width\":null}],\"name\":\"Sunny & Bright Classical\",\"owner\":{\"display_name\":\"Alexander C\",\"external_urls\":{\"spotify\":\"https://open.spotify.com/user/swarmnet\"},\"href\":\"https://api.spotify.com/v1/users/swarmnet\",\"id\":\"swarmnet\",\"type\":\"user\",\"uri\":\"spotify:user:swarmnet\"},\"primary_color\":null,\"public\":null,\"snapshot_id\":\"MTEzMiwwZWJjYmQ5ZmFiOTQ4NTEwMzI4YmRkYjYyNjUwZWEzY2FlODJkMTRm\",\"tracks\":{\"href\":\"https://api.spotify.com/v1/playlists/4Si2Apa6JTtU03o4MqHHAk/tracks\",\"total\":1009},\"type\":\"playlist\",\"uri\":\"spotify:playlist:4Si2Apa6JTtU03o4MqHHAk\"}],\"limit\":5,\"next\":\"https://api.spotify.com/v1/search?query=Clouds+day&type=playlist&market=US&locale=en-US%2Cen%3Bq%3D0.9&offset=5&limit=5\",\"offset\":0,\"previous\":null,\"total\":1000}}');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jsonObjs`
--
ALTER TABLE `jsonObjs`
  ADD PRIMARY KEY (`callId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jsonObjs`
--
ALTER TABLE `jsonObjs`
  MODIFY `callId` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;