// resources/backend.js

// Placeholder data for each school
const schoolData = {
   rpi: {
       weather: {
           condition: "Cloudy",
           windSpeed: "3 mph",
           pressure: "1024 hPa",
           humidity: "55%",
           temperature: "55.44 °F",
           feelsLike: "54.0 °F",
           minTemp: "52.0 °F",
           maxTemp: "58.0 °F"
       },
       spotify: [
           { title: "RPI Mix", author: "RPI DJ", img: "https://example.com/rpi-mix.png" },
           { title: "Study Beats", author: "Campus Tunes", img: "https://example.com/study-beats.png" },
           { title: "RPI Vibes", author: "RPI Radio", img: "https://example.com/rpi-vibes.png" }
       ]
   },
   clemson: {
       weather: {
           condition: "Sunny",
           windSpeed: "5 mph",
           pressure: "1018 hPa",
           humidity: "45%",
           temperature: "68.12 °F",
           feelsLike: "67.0 °F",
           minTemp: "65.0 °F",
           maxTemp: "70.0 °F"
       },
       spotify: [
           { title: "Tiger Beats", author: "Clemson Music Club", img: "https://example.com/tiger-beats.png" },
           { title: "Sunny Days", author: "Sunshine Collective", img: "https://example.com/sunny-days.png" },
           { title: "Clemson Classics", author: "Clemson Radio", img: "https://example.com/clemson-classics.png" }
       ]
   },
   umiami: {
       weather: {
           condition: "Rainy",
           windSpeed: "12 mph",
           pressure: "1005 hPa",
           humidity: "75%",
           temperature: "77.88 °F",
           feelsLike: "79.0 °F",
           minTemp: "75.0 °F",
           maxTemp: "80.0 °F"
       },
       spotify: [
           { title: "Miami Vibes", author: "UMiami DJ", img: "https://example.com/miami-vibes.png" },
           { title: "Tropical Hits", author: "Island Grooves", img: "https://example.com/tropical-hits.png" },
           { title: "UMiami Favorites", author: "UMiami Radio", img: "https://example.com/umiami-favorites.png" }
       ]
   }
};

// Event listener for the "Fetch From APIs!" button
document.getElementById('fetch-btn').addEventListener('click', function() {
   // Hide the initial page and show the main content
   document.getElementById('initial-page').classList.add('hidden');
   document.getElementById('main-content').classList.remove('hidden');
});

// Event listener for the "Show More Info" button
document.getElementById('show-more-info-btn').addEventListener('click', function() {
   const extraWeatherInfo = document.getElementById('extra-weather-info');
   const extraSpotifyInfo = document.getElementById('extra-spotify-info');
   
   // Toggle visibility of extra information for both weather and Spotify
   if (extraWeatherInfo.classList.contains('hidden') && extraSpotifyInfo.classList.contains('hidden')) {
       // Show extra info
       extraWeatherInfo.classList.remove('hidden');
       extraSpotifyInfo.classList.remove('hidden');
       this.innerText = 'Show Less Info'; // Change button text
   } else {
       // Hide extra info
       extraWeatherInfo.classList.add('hidden');
       extraSpotifyInfo.classList.add('hidden');
       this.innerText = 'Show More Info'; // Change button text back
   }
});

// Event listener for the school dropdown menu
document.getElementById('school-select').addEventListener('change', function() {
   const selectedSchool = this.value;

   // Update the page title and tab title
   const pageTitle = `${this.options[this.selectedIndex].text} Weather & Music!`;
   document.querySelector('h1').innerHTML = `<span class="rpi">${this.options[this.selectedIndex].text}</span> Weather & Music!`;
   document.title = pageTitle;

   // Get the weather and Spotify data for the selected school
   const selectedData = schoolData[selectedSchool];

   // Update weather section
   document.getElementById('weather-condition').innerText = selectedData.weather.condition;
   document.getElementById('wind-speed').innerText = selectedData.weather.windSpeed;
   document.getElementById('pressure').innerText = selectedData.weather.pressure;
   document.getElementById('humidity').innerText = selectedData.weather.humidity;
   document.getElementById('temperature').innerText = selectedData.weather.temperature;
   document.getElementById('feels-like').innerText = selectedData.weather.feelsLike;
   document.getElementById('min-temp').innerText = selectedData.weather.minTemp;
   document.getElementById('max-temp').innerText = selectedData.weather.maxTemp;

   // Update Spotify section
   const spotifyPlaylists = document.querySelectorAll('.playlist');
   selectedData.spotify.forEach((playlist, index) => {
       spotifyPlaylists[index].querySelector('p:first-child').innerText = `${index + 1}. ${playlist.title}`;
       spotifyPlaylists[index].querySelector('p:last-child').innerText = `Author: ${playlist.author}`;
       spotifyPlaylists[index].querySelector('img').src = playlist.img;
   });
});
