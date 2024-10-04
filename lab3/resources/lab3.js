/*Lab3 JavaScript File Placed variables and functions in this file */

/*Important to note, Weather Hardcoded for Possible locations */


// GLOBAL VARS -> all reset on reload
var weathCt = 1; 
var SPOTIFYKEY;
var WEATHERID = 0; 
var PLAYID = 0; 


/*FUNCTIONS*/

/*When called, toggles showing additional info or not. 
Does this by playing with DOM element attributes*/
function showMore(){
   if(weathCt %2 == 0){
      // Weather Info
      $("#initHideW").fadeOut(); 
      $('#lastU').css('margin-top', '10%');

      // Spotify info
      $(".auth").fadeOut();
      $(".playIm").fadeOut();

      $('#show').html('Show More Info');
      weathCt += 1; 
   }else{
      
      $("#initHideW").fadeIn(); 
      $('#lastU').css('margin-top', '35%');

      $(".auth").fadeIn();
      $(".playIm").fadeIn();

      $('#show').html('Show Less Info');
      weathCt += 1; 
   }
}

/*Makes a call to the spotify API to retrieve a key so that we can 
actually make real search requests. Returns a promise*/ 
async function getSpotKey(){
   
   const url = "https://accounts.spotify.com/api/token";

   //Strings together URL in correct format so I don't have to 
   const params = new URLSearchParams();
   params.append("grant_type", "client_credentials");
   params.append("client_id", "2b04a417936c456485b5146fa07b76c2");
   params.append("client_secret", "9420db774a6348a5a94e5a40685b35d4");

   //Note this is post
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

/*Fetches the weather data from the API and returns a promise of it converted into JSON */ 
async function getWeath(lat,lon){
   var fetchRes = await fetch("https://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon + "&units=imperial&appid=76b8f36558ce3b5fbce8ba9d025e5fe9");
   var jsonRes = await fetchRes.json();
   return(jsonRes); 
}

/*Fetches the search query result data from the SPotify api given a get and a search term. A promise of the return converted to JSON is returned.  */ 
async function getPlays(auth,searchTerm){

   var fetchRes = await fetch("https://api.spotify.com/v1/search?q=" + searchTerm + "&type=playlist&market=US&limit=5&offset=0", { 
      headers: {
         'Authorization': auth
      }
   })
   var jsonRes = await fetchRes.json();
   return(jsonRes);
}


async function insert(jsonDat){


   //send json to PHP
   //remember, relative to page running on 
   //Makes post request to php file, basically sends it the JSON 
   var res = await fetch("resources/initInDb.php", {
      "method" : "POST",
      "headers" : {
         //Tells php that the body of the request is json 
         "Content-Type" : "application/json; charset=utf-8"
      },
      // stringify is vital and php will recieve this as a plain string
      "body" : JSON.stringify(jsonDat)

   })

   var newRes = await res.text(); 
   return(newRes);

}

async function retrieve(id){


   //send json to PHP
   //remember, relative to page running on 
   //Makes post request to php file, basically sends it the JSON 
   var res = await fetch("resources/retrieveDb.php", {
      "method" : "POST",
      "headers" : {
         //Tells php that the body of the request is json 
         "Content-Type" : "application/json; charset=utf-8"
      },
      // stringify is vital and php will recieve this as a plain string
      "body" : JSON.stringify(id)

   })

   var newRes = await res.json(); 
   return(newRes);

}


async function overwrite(overDat, id){
   var res = await fetch("resources/overwrite.php", {
      "method" : "POST",
      "headers" : {
         //Tells php that the body of the request is json 
         "Content-Type" : "application/json; charset=utf-8"
      },
      // stringify is vital and php will recieve this as a plain string
      "body" : JSON.stringify(overDat)+ id

   })

   var newRes = await res.text(); 
   return(newRes);
}

function popHTML(weathDat, plays){

   //get Weather info and insert into HTML
   const pngUrl = "https://openweathermap.org/img/wn/" + weathDat.weather[0].icon +  "@2x.png";
   $("#description").html(weathDat.weather[0].main)
   $("#curWeath").attr('src', pngUrl);
   $("#windSpeed").html(weathDat.wind.speed);
   $("#press").html(weathDat.main.pressure);
   $("#humid").html(weathDat.main.humidity);
   $("#temp").html(weathDat.main.temp);
   $("#fl").html(weathDat.main.feels_like);
   $("#min").html(weathDat.main.temp_min);
   $("#max").html(weathDat.main.temp_max);
   var date = new Date(weathDat.dt*1000);
   $("#time").html(date);


   //loading images and links in
   $("#oneIm").attr('src', plays.playlists.items[0].images[0].url);
   $("#oneLin").attr('href', plays.playlists.items[0].external_urls.spotify);
   $("#titlOne").html(plays.playlists.items[0].name);
   $("#auOne").html(plays.playlists.items[0].owner.display_name);


   $("#twoIm").attr('src', plays.playlists.items[1].images[0].url);
   $("#twoLin").attr('href', plays.playlists.items[1].external_urls.spotify);
   $("#titlTwo").html(plays.playlists.items[1].name);
   $("#auTwo").html(plays.playlists.items[1].owner.display_name);

   $("#threeIm").attr('src', plays.playlists.items[2].images[0].url);
   $("#threeLin").attr('href', plays.playlists.items[2].external_urls.spotify);
   $("#titlThree").html(plays.playlists.items[2].name);
   $("#auThree").html(plays.playlists.items[2].owner.display_name);

   $("#fourIm").attr('src', plays.playlists.items[3].images[0].url);
   $("#fourLin").attr('href', plays.playlists.items[3].external_urls.spotify);
   $("#titlFour").html(plays.playlists.items[3].name);
   $("#auFour").html(plays.playlists.items[3].owner.display_name);

   $("#fiveIm").attr('src', plays.playlists.items[4].images[0].url);
   $("#fiveLin").attr('href', plays.playlists.items[4].external_urls.spotify);
   $("#titlFive").html(plays.playlists.items[4].name);
   $("#auFive").html(plays.playlists.items[4].owner.display_name);

   //hides all images for 'show more' functionality  
   $(".playIm").css('display', 'none');

}

//when box is changed
async function locCheck(){
   var selBox = document.getElementById("locSel");

   if (selBox.value == "Clemson"){
      const weathDat = await getWeath("34.683437", "-82.837364");
      var auth = 'Bearer ' + SPOTIFYKEY; 
      var searchTerm = weathDat.weather[0].main + " day"; 
      const plays = await getPlays(auth,searchTerm);

      //overwrite existing entries 
      var weathSuc = await overwrite(weathDat, WEATHERID);
      var playsSuc = await overwrite(plays, PLAYID);
      if(weathSuc!= 1 || playsSuc != 1){
         console.log("overwrite error"); 
      }
      //retrieve
      const initWeath = await retrieve(WEATHERID);
      const initPlays = await retrieve(PLAYID);

      console.log(initWeath);
      console.log(initPlays);

      //populate
      popHTML(initWeath,initPlays);
   }else if(selBox.value == "RPI"){

      const weathDat = await getWeath("42.7284", "-73.6918");
      var auth = 'Bearer ' + SPOTIFYKEY; 
      var searchTerm = weathDat.weather[0].main + " day"; 
      const plays = await getPlays(auth,searchTerm);

      //overwrite existing entries 
      var weathSuc = await overwrite(weathDat, WEATHERID);
      var playsSuc = await overwrite(plays, PLAYID);
      if(weathSuc!= 1 || playsSuc != 1){
         console.log("overwrite error"); 
      }
      //retrieve
      const initWeath = await retrieve(WEATHERID);
      const initPlays = await retrieve(PLAYID);

      console.log(initWeath);
      console.log(initPlays);

      //populate
      popHTML(initWeath,initPlays);

   }else if(selBox.value == "UMiami"){

      const weathDat = await getWeath("25.761681", "80.191788");
      var auth = 'Bearer ' + SPOTIFYKEY; 
      var searchTerm = weathDat.weather[0].main + " day"; 
      const plays = await getPlays(auth,searchTerm);

      //overwrite existing entries 
      var weathSuc = await overwrite(weathDat, WEATHERID);
      var playsSuc = await overwrite(plays, PLAYID);
      if(weathSuc!= 1 || playsSuc != 1){
         console.log("overwrite error"); 
      }
      //retrieve
      const initWeath = await retrieve(WEATHERID);
      const initPlays = await retrieve(PLAYID);

      console.log(initWeath);
      console.log(initPlays);

      //populate
      popHTML(initWeath,initPlays);

   }

   /*troy: 
   lat: 42.7284
   long: -73.6918
   */
}

/*Fetch Data from API's and show it on the page*/
async function apiBut(){

   //Getting key For Spotify 
   const key = await getSpotKey()
   SPOTIFYKEY = key; 
   //getting weather 
   const weatherData = await getWeath("42.7284", "-73.6918");

   var auth = 'Bearer ' + key; 
   var searchTerm = weatherData.weather[0].main + " day"; 

   const plays = await getPlays(auth,searchTerm);

   //insert into database
   const weathID = await insert(weatherData); 
   const playsID = await insert(plays);

   WEATHERID = weathID; 
   PLAYID = playsID; 

   //init retrieve and populate 
   const initWeath = await retrieve(weathID);
   const initPlays = await retrieve(playsID);

   //Display Stuff 
   popHTML(initWeath,initPlays);


   //so that user cannot make box selection before global ID's are set
   $("#firstSec").fadeOut();
   $("#mainSec").fadeIn();

}
