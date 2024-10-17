<?php
// index.php
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="resources/styles.css">
    <script src="resources/scripts.js" defer></script> <!-- Existing scripts.js -->
    <script src="resources/backend.js" defer></script> <!-- New backend.js -->
    <title>R.P.I. Weather & Music!</title>
</head>
<body>

<header>
    <h1><span class="rpi">R.P.I.</span> Weather & Music!</h1>
</header>

<div class="container">
    <!-- Initial page with the fetch button -->
    <div id="initial-page">
        <button class="fetch-button" id="fetch-btn">Click to Fetch From APIs!</button>
    </div>

    <!-- Main content initially hidden -->
    <div class="hidden" id="main-content">
        <div class="dropdown-container">
            <label for="school-select">Pick a school!</label>
            <select id="school-select" class="school-dropdown">
                <option value="rpi">RPI</option>
                <option value="clemson">Clemson</option>
                <option value="umiami">UMiami</option>
            </select>
        </div>

        <div class="row">
            <div class="column">
                <div class="weather">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/8/8d/Sunny.svg" alt="Weather Icon" class="weather-icon">
                    <h2>Current Weather:</h2>
                    <p>Condition: <span id="weather-condition">Clouds</span></p>
                    <p>Wind Speed: <span id="wind-speed">3 mph</span></p>
                    <p>Pressure: <span id="pressure">1024 hPa</span></p>
                    <p>Humidity: <span id="humidity">55 %</span></p>
                    <p>Temperature: <span id="temperature">55.44 °F</span></p>

                    <!-- New Fields (initially hidden) -->
                    <div id="extra-weather-info" class="hidden">
                        <p>Feels Like: <span id="feels-like">54.0 °F</span></p>
                        <p>Min Temp: <span id="min-temp">52.0 °F</span></p>
                        <p>Max Temp: <span id="max-temp">58.0 °F</span></p>
                    </div>
                </div>
            </div>

            <div class="column">
                <div class="music">
                    <h2>Suggested Spotify Playlists:</h2>
                    <div class="playlist">
                        <img src="https://upload.wikimedia.org/wikipedia/en/e/e7/Pink_Floyd_-_The_Dark_Side_of_the_Moon.png" alt="Playlist 1" class="spotify-icon">
                        <p>1. Pink Floyd - Best Of</p>
                        <p>Author: <span id="author-1">Pink Floyd</span></p>
                    </div>
                    <div class="playlist">
                        <img src="https://upload.wikimedia.org/wikipedia/en/b/b5/Cloudy_Weather.jpg" alt="Playlist 2" class="spotify-icon">
                        <p>2. Clouds Radio</p>
                        <p>Author: <span id="author-2">Clouds Inc.</span></p>
                    </div>
                    <div class="playlist">
                        <img src="https://upload.wikimedia.org/wikipedia/en/b/b8/Children%27s_Songs_About_Rain.jpg" alt="Playlist 3" class="spotify-icon">
                        <p>3. Rainy Days 🌧️ Kids Songs about rain, clouds and puddles</p>
                        <p>Author: <span id="author-3">Kiddo Tunes</span></p>
                    </div>
                    <div class="playlist">
                        <img src="https://upload.wikimedia.org/wikipedia/en/5/58/Cloudy_and_Rainy_Days.jpg" alt="Playlist 4" class="spotify-icon">
                        <p>4. Cloudy and Rainy Days</p>
                        <p>Author: <span id="author-4">Mood Music</span></p>
                    </div>
                    <div class="playlist">
                        <img src="https://upload.wikimedia.org/wikipedia/en/2/29/Strange_Days_OST.jpg" alt="Playlist 5" class="spotify-icon">
                        <p>5. Strange Days (1995) Original Motion Picture Soundtrack</p>
                        <p>Author: <span id="author-5">Soundtrack Artists</span></p>
                    </div>

                    <!-- New Fields for Spotify (initially hidden) -->
                    <div id="extra-spotify-info" class="hidden">
                        <p>More playlists will show here...</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="button-container">
            <button class="show-more-info" id="show-more-info-btn">Show More Info</button>
        </div>

        <div class="last-updated">Last Updated: <span id="last-updated">Thu Oct 17 2024 14:05:62 GMT-0400 (Eastern Daylight Time)</span></div>
    </div>
</div>

<footer>
    <div class="footer-icons">
        <img src="path/to/discord-icon.png" alt="Discord">
        <img src="path/to/github-icon.png" alt="GitHub">
    </div>
    <p>&copy; 2024 Fodera Sites</p>
</footer>

</body>
</html>
