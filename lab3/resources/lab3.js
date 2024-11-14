/*Lab3 JavaScript File Placed variables and functions in this file */

/*Important to note, Weather Hardcoded for Possible locations */


// GLOBAL VARS -> all reset on reload
var weathCt = 1; 
var SPOTIFYKEY;
var WEATHERID = 0; 
var PLAYID = 0; 


/*FUNCTIONS*/

/*DISPLAY FUNCTIONS*/

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


/* Given weather and playlist JSON's, this function populates the page
with the information from these JSONS*/
function popHTML(weathDat, plays){

   //weather info
   const pngUrl = "https://openweathermap.org/img/wn/" + weathDat.weather[0].icon +  "@2x.png";
   $("#description").html(weathDat.weather[0].main);
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

   //Playlist info
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
}

/*API CALL FUNCTIONS*/

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


/*Fetches the search query result data from the Spotify api given a get and a search term. A promise of the return converted to JSON is returned.  */ 
async function getPlays(auth,searchTerm){

   var fetchRes = await fetch("https://api.spotify.com/v1/search?q=" + searchTerm + "&type=playlist&market=US&limit=5&offset=0", { 
      headers: {
         'Authorization': auth
      }
   })
   var jsonRes = await fetchRes.json();
   return(jsonRes);
}


/*PHP SCRIPT FUNCTIONS*/

/*Passes jsonData to a PHP script using the fetch method in order to stor it in mySQL database. Returns the ID of 
the row created */
async function insert(jsonDat){

   //send json to PHP
   //URL relative to page running on (index.php)
   //Makes post request to php file, basically sends it the JSON 
   var res = await fetch("initInDb.php", {
      "method" : "POST",
      "headers" : {
         //Tells php that the body of the request is json 
         "Content-Type" : "application/json; charset=utf-8"
      },
      // stringify is vital and php will recieve this as a plain string
      "body" : JSON.stringify(jsonDat)

   })

   var id = await res.text(); 
   return(id);
}


/*Passes id to a PHP script using the fetch method in order to retrieve JSON at that ID. Returns the JSON data of 
the id given */
async function retrieve(id){
 
   var res = await fetch("retrieveDb.php", {
      "method" : "POST",
      "headers" : {
         "Content-Type" : "application/json; charset=utf-8"
      },
      "body" : JSON.stringify(id)
   })

   var newRes = await res.json(); 
   return(newRes);
}


/*Passes id and data to a PHP script using the fetch method in order to Update the JSON at that id. Returns 1 if Update was 
succesfull and 0 if not */
async function overwrite(overDat, id){

   var res = await fetch("overwrite.php", {
      "method" : "POST",
      "headers" : {
         "Content-Type" : "application/json; charset=utf-8"
      },
      "body" : JSON.stringify(overDat)+ id

   })

   var newRes = await res.text(); 
   return(newRes);
}

/*USER TRIGGERED FUNCTIONS*/

/*Called everytime the dropdox menu is changed. Updates the page accordingly based on the value selected from the dropdown.*/
async function locCheck(){
   //The val selected
   var selBox = document.getElementById("locSel");

   if (selBox.value == "Clemson"){

      //change title/header
      $("#univTitle").html("<span class=\"orange\">Clemson</span>");
      $("title").html("Clemson Weather & Music");

      //make API Calls
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

      //retrieve from DB
      const initWeath = await retrieve(WEATHERID);
      const initPlays = await retrieve(PLAYID);

      //populate
      popHTML(initWeath,initPlays);
   }else if(selBox.value == "RPI"){
      //change title/header
      $("#univTitle").html("<span class=\"red\">R.</span><span class=\"white\">P.</span><span class=\"red\">I.</span>");
      $("title").html("RPI Weather & Music");

      //make API Calls
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
      //retrieve from DB 
      const initWeath = await retrieve(WEATHERID);
      const initPlays = await retrieve(PLAYID);

      //populate
      popHTML(initWeath,initPlays);

   }else if(selBox.value == "UMiami"){

      //Change title/Header
      $("#univTitle").html("<span class=\"orange\">U</span><span class=\"green\">Miami</span>");
      $("title").html("UMiami Weather & Music");

      //make API Calls
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

      //populate
      popHTML(initWeath,initPlays);
   }
}


/*Call when fetch API data button is pressed. Calls each of the APIS with troy as the default and 
populates the screen accordingly. */
async function apiBut(){



   //Making calls
   const key = await getSpotKey()
   SPOTIFYKEY = key; 
   const weatherData = await getWeath("42.7284", "-73.6918");
   var auth = 'Bearer ' + key; 
   var searchTerm = weatherData.weather[0].main + " day"; 
   const plays = await getPlays(auth,searchTerm);

   //insert into database
   const weathID = await insert(weatherData); 
   const playsID = await insert(plays);


   //so that user cannot make box selection before global ID's are set
   $("#firstSec").fadeOut();
   window.location.href = 'https://foderj.eastus.cloudapp.azure.com/ITWS-2110-F24-foderj/lab3/resources/weathMus.php';
   $("#mainSec").fadeIn();
   
   //setting globs for future calls
   WEATHERID = weathID; 
   PLAYID = playsID; 

   //init retrieve and populate 
   const initWeath = await retrieve(weathID);
   const initPlays = await retrieve(playsID);

   // populate screen 
   popHTML(initWeath,initPlays);



}
