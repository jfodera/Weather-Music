/*Lab2 JavaScript File Placed variables and functions in this file */

// GLOBAL VARS
var weathCt = 1; 

//takes underline off temp and presents rest 
function showMore(){
   if(weathCt %2 == 0){
      $("#initHideW").fadeOut(); 
      $(".auth").fadeOut();
      $(".playIm").fadeOut();
      weathCt += 1; 
      $('#lastU').css('margin-top', '10%');
      $('#show').html('Show More Info');
   }else{
      $("#initHideW").fadeIn(); 
      $(".auth").fadeIn();
      $(".playIm").fadeIn();
      weathCt += 1; 
      $('#lastU').css('margin-top', '35%');
      $('#show').html('Show Less Info');
   }
}

//must return a promise 
async function getSpotKey(){
   
   const url = "https://accounts.spotify.com/api/token";

   //Strings together URL in correct format so I don't have to 
   const params = new URLSearchParams();
   params.append("grant_type", "client_credentials");
   params.append("client_id", "2b04a417936c456485b5146fa07b76c2");
   params.append("client_secret", "9420db774a6348a5a94e5a40685b35d4");

   var fetchRes = await fetch(url, {
      method: "POST",
      headers: {
         "Content-Type": "application/x-www-form-urlencoded",
      },
      body: params.toString(),
   })

   // Because .json also returns a promise
   var parsed = await fetchRes.json()
   var key = parsed.access_token; 
   return(key);
}


async function getWeath(){
   var fetchRes = await fetch("https://api.openweathermap.org/data/2.5/weather?lat=42.7284&lon=-73.6918&units=imperial&appid=76b8f36558ce3b5fbce8ba9d025e5fe9");
   var jsonRes = await fetchRes.json();
   return(jsonRes); 
}

async function getPlays(auth,searchTerm){

   var fetchRes = await fetch("https://api.spotify.com/v1/search?q=" + searchTerm + "&type=playlist&market=US&limit=5&offset=0", { 
      headers: {
         'Authorization': auth
      }
   })

   var jsonRes = await fetchRes.json();
   return(jsonRes);
}


/*MAIN*/
$(document).ready(function() {

   //Get main promises 

   //Getting key For Spotify 
   const key = getSpotKey()
   //getting weather 
   const weatherData = getWeath()

   //waits for both promises to finish
   Promise.all([key, weatherData])
      
   .then(function(vals) {
      var auth = 'Bearer ' + vals[0]; 
      var searchTerm = vals[1].weather[0].description + " day"; 

      
      //get png 
      const pngUrl = "https://openweathermap.org/img/wn/" + vals[1].weather[0].icon +  "@2x.png";
      $("#description").html(vals[1].weather[0].main)
      $("#curWeath").attr('src', pngUrl);
      $("#windSpeed").html(vals[1].wind.speed);
      $("#press").html(vals[1].main.pressure);
      $("#humid").html(vals[1].main.humidity);
      $("#temp").html(vals[1].main.temp);
      $("#fl").html(vals[1].main.feels_like);
      $("#min").html(vals[1].main.temp_min);
      $("#max").html(vals[1].main.temp_max);

      var date = new Date(vals[1].dt*1000);
      $("#time").html(date);

      //Make Request Using key 
      getPlays(auth,searchTerm)
      //reading plays promise
      .then(function(plays){
         //loading titles and authors in


         //loading images and links in
         $("#oneIm").attr('src', plays.playlists.items[0].images[0].url);
         $("#oneLin").attr('href', plays.playlists.items[0].external_urls.spotify);
         $("#twoIm").attr('src', plays.playlists.items[1].images[0].url);
         $("#twoLin").attr('href', plays.playlists.items[1].external_urls.spotify);
         $("#threeIm").attr('src', plays.playlists.items[2].images[0].url);
         $("#threeLin").attr('href', plays.playlists.items[2].external_urls.spotify);
         $("#fourIm").attr('src', plays.playlists.items[3].images[0].url);
         $("#fourLin").attr('href', plays.playlists.items[3].external_urls.spotify);
         $("#fiveIm").attr('src', plays.playlists.items[4].images[0].url);
         $("#fiveLin").attr('href', plays.playlists.items[4].external_urls.spotify);

         
         //loading in titles and authors
         $("#titlOne").html(plays.playlists.items[0].name);
         $("#auOne").html(plays.playlists.items[0].owner.display_name);
         $("#titlTwo").html(plays.playlists.items[1].name);
         $("#auTwo").html(plays.playlists.items[1].owner.display_name);
         $("#titlThree").html(plays.playlists.items[2].name);
         $("#auThree").html(plays.playlists.items[2].owner.display_name);
         $("#titlFour").html(plays.playlists.items[3].name);
         $("#auFour").html(plays.playlists.items[3].owner.display_name);
         $("#titlFive").html(plays.playlists.items[4].name);
         $("#auFive").html(plays.playlists.items[4].owner.display_name);

         //hides all images for 'show more' 
         $(".playIm").css('display', 'none');
      })

      

    })


});


