<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>R.P.I. Weather & Music</title>
    <link rel="stylesheet" type="text/css" href="resources/styles.css">
    <script src="resources/scripts.js" defer></script> <!-- Include the JavaScript -->
</head>
<body>
    <div class="container">
        <header>
            <h1><span class="rpi">R.P.I.</span> Weather & Music!</h1>
        </header>

        <!-- Button to fetch content -->
        <button id="fetchButton" class="fetch-button">Click to Fetch From APIs!</button>

        <!-- Content that is initially hidden (Page 2) -->
        <div id="contentSection" class="content hidden">

            <!-- Dropdown Menu to Select School (Centered at the top) -->
            <div class="dropdown-container">
                <label for="schoolSelect">Pick a school!!</label>
                <select id="schoolSelect" class="school-dropdown">
                    <option value="RPI">RPI</option>
                    <option value="Clemson">Clemson</option>
                    <option value="Umiami">Umiami</option>
                </select>
            </div>

            <!-- Weather Section -->
            <div class="weather">
                <h2>Current Weather:</h2>
                <div class="weather-content">
                    <img src="cloud_icon.png" alt="Weather Icon" class="weather-icon">
                    <div class="weather-info">
                        <p>Clouds</p>
                        <p><strong>Wind Speed:</strong> 3 mph</p>
                        <p><strong>Pressure:</strong> 1024 hPa</p>
                        <p><strong>Humidity:</strong> 55%</p>
                        <p><strong>Temperature:</strong> 55.44°F</p>
                    </div>
                </div>
                <p class="last-updated">Last Updated: Thu Oct 17 2024 14:05:32 GMT-0400 (Eastern Daylight Time)</p>
            </div>

            <!-- Music Section -->
            <div class="music">
                <h2>Suggested Spotify Playlists:</h2>
                <img src="spotify_icon.png" alt="Spotify Icon" class="spotify-icon">
                <ol>
                    <li><a href="#">Pink Floyd - Best Of</a></li>
                    <li><a href="#">Clouds Radio</a></li>
                    <li><a href="#">Rainy Days ☔ Kids Songs about rain, clouds and puddles</a></li>
                    <li><a href="#">Cloudy and rainy days</a></li>
                    <li><a href="#">Strange Days (1995) Original Motion Picture Soundtrack</a></li>
                </ol>
            </div>

            <!-- Show More Info Button -->
            <button id="showMoreInfo" class="show-more-info">Show More Info</button>
        </div>

        <footer>
            <p>©2024 Fodera Sites</p>
            <div class="footer-icons">
                <img src="discord_icon.png" alt="Discord Icon">
                <img src="controller_icon.png" alt="Controller Icon">
            </div>
        </footer>
    </div>
</body>
</html>
