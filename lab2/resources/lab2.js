/*Lab2 JavaScript File Placed variables and functions in this file */

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
   var fetchRes = await fetch("https://api.openweathermap.org/data/2.5/weather?lat=42.7284&lon=73.6918&units=imperial&appid=76b8f36558ce3b5fbce8ba9d025e5fe9");
   var jsonRes = await fetchRes.json();
   return(jsonRes); 
}

async function getPlays(auth,searchTerm){

   fetch("https://api.spotify.com/v1/search?q=" + searchTerm + "&type=playlist&market=US&limit=5&offset=0", { 
      headers: {
         'Authorization': auth
      }
   })

   .then(function(searchRes){
      //have to handle response
      return(searchRes.json());
   })

   //success
   .then(function(searchData){
      // $("body").html(JSON.stringify(searchData, null, 2)) 
      console.log(searchData); 
   })
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
      
   .then((vals) => {
      console.log(vals); 
      var auth = 'Bearer ' + vals[0]; 
      var searchTerm = vals[1].weather[0].description + " day"; 
      const playlists = getPlays(auth,searchTerm); 
      //Make Request Using key 
      //query Right not is rainy 

    })
   
    //can pass dt as argument of date for conversion
    var date = new Date(1727397715*1000);
    console.log(date); 

});


