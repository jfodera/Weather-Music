// resources/backend.js

document.getElementById('fetch-btn').addEventListener('click', function() {
   document.getElementById('initial-page').classList.add('hidden');
   document.getElementById('main-content').classList.remove('hidden');
});

document.getElementById('show-more-info-btn').addEventListener('click', function() {
   // Show additional weather information
   document.getElementById('feels-like').innerText = "54.0 °F"; // Placeholder value
   document.getElementById('min-temp').innerText = "52.0 °F"; // Placeholder value
   document.getElementById('max-temp').innerText = "58.0 °F"; // Placeholder value

   // Show additional Spotify playlist information
   document.getElementById('author-1').innerText = "Pink Floyd"; // Placeholder value
   document.getElementById('author-2').innerText = "Clouds Inc."; // Placeholder value
   document.getElementById('author-3').innerText = "Kiddo Tunes"; // Placeholder value
   document.getElementById('author-4').innerText = "Mood Music"; // Placeholder value
   document.getElementById('author-5').innerText = "Soundtrack Artists"; // Placeholder value

   // Show playlist images (replace with actual paths)
   document.querySelector('.spotify-icon').src = "path/to/playlist1-image.png"; // Placeholder image
   document.querySelectorAll('.spotify-icon')[1].src = "path/to/playlist2-image.png"; // Placeholder image
   document.querySelectorAll('.spotify-icon')[2].src = "path/to/playlist3-image.png"; // Placeholder image
   document.querySelectorAll('.spotify-icon')[3].src = "path/to/playlist4-image.png"; // Placeholder image
   document.querySelectorAll('.spotify-icon')[4].src = "path/to/playlist5-image.png"; // Placeholder image
});
