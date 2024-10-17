// resources/backend.js

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
   const selectedSchool = this.options[this.selectedIndex].text;

   // Update the page title and tab title
   const pageTitle = `${selectedSchool} Weather & Music!`;
   
   document.querySelector('h1').innerHTML = `<span class="rpi">${selectedSchool}</span> Weather & Music!`;
   document.title = pageTitle;
});
