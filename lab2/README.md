Lab 2 notes: 

Summary: Overall a really cool lab and defintley learned a lot. Had never realy worked with API's too much before and I think for this really being
my first true time, the final product came out pretty good. I initially struggled at even finding the right weather API to pull from. Once I did, I read the documentation and the weather one was pretty simple from there. After that I found the spotify API and thats when I came up with the
idea for curating muscic based off of the weather. Issue was I had no clue how to use the spotify API and that was defintley a process. I ended up having to make a POST request for a key and then using that key to make a search query to the API which was defintley difficult but I'm glad I struggled through it because I know what to do now. Also, the spotify API documentation is really nice. After that it was really just styling 
and laying out my website. I figured I could add some cool interactivity with the show more button along with all of the things in the DOM that
rely on the API's. I'm really happy with my finished product and while it was a struggle at times this was defintley a good experience. 

Plan: 

<a href='bscsd.org'> test</a>

Make a website that calls and presents the weather API 
Then uses info from that call to call the spotify API 

Weather Data Used: 
   weather.icon -> png 
   weather.description 
   Wind Speed
   pressure
   humidity
   temperature -> cliick on for 
      Feels like
      Min Temp 
      Max Temp 
   time (presented as date )


   will search spotify for "*condition* day"
   returns and presents to the user top 5 playlists reccomended based on the weather
      Displays: image, title of playlist, and author 


Before submit checklist: 
   Everything Validates  √ 
   Adjust innerHold padding bottom once boxes curated √
   delete commented out √
   go over readme 
   works at check that its up at this exact URL: https://foderj.eastus.cloudapp.azure.com/ITWS-2110-F24-foderj/lab2

Questions: 
   Why is the height of both boxes linked together 


Outline: 
set up vm 

Must put SSL certs (https on your vm)
Figure out what a promise is 

Use 10 peices of data acress each of the API’s 
   5 and 5


Weather API I'm calling: https://openweathermap.org/current
   Documentation: https://openweathermap.org/current#data
   updates after every call

Spotify API I'm calling (really nice documentation):
   https://developer.spotify.com/documentation/web-api/reference/search

Following this flow for Spotify API: https://developer.spotify.com/documentation/web-api/tutorials/client-credentials-flow
   whenever a user opens the website, an acsess token is created, then that token is used to make the search call from the weather data 

Can copy and paste code chunk that into beginning of lab 2 




Things I learned: 
AJAX vs json look at slides
   Fetch API is a simpler promised based syntax and more moder than using ajax
Promise: an object representing the eventual completion or failure of an asynchronous operation
Then: for asyncronous coding
.json Method: 
   Note that despite the method being named json(), the result is not JSON but is instead the result of taking JSON as input and parsing it to produce 
By default, fetch makes get requests
Then calls immedietley jump from one to another, returning result of previous one to the next
No semicolon after Fetch call
No '}' in API calls 
No ';' After calling async functions

having js included at the bottom of the body allows the visuals to load faster by not incuding it in the head 
Breakpoints are just site rearrangements when the size changes 

thens are like chains

Put a ';' at the end of the last then statement

For some Reason, You can initially hide dynamically allocated things through ID's but not classes 


Future improvements: 
   Make it for any location 
   Could do an ajax esc for loop and customize how many songs are returned but for right now stick to 5
   Figure out why spotify doesn't always return 5 song results 


Citations
For POST request using fetch: https://www.geeksforgeeks.org/simple-post-request-using-the-fetch-api/?ref=oin_asr4
URL Search Params, to make conversion to fetchh call easier: https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams
How to add fetch Auth header: https://jasonwatmore.com/fetch-add-bearer-token-authorization-header-to-http-request#:~:text=Add%20Authorization%20Header,to%20the%20fetch()%20function.
Async: https://www.w3schools.com/js/js_async.asp
   can use await instead of then to return something and maintain async nature
Promise All Docs: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/all
Date Conversion: https://stackoverflow.com/questions/40761205/javascript-convert-timestamp-to-human-readable-date
Unix time stamp is the format the day and time is recieved used this to help parse: https://www.unixtimestamp.com/
   # of seconds since Jan 01 1970 



Helpful Code Chunks: 

To see raw JSON, use log : 
   const params = new URLSearchParams();
   params.append("grant_type", "client_credentials");
   params.append("client_id", "2b04a417936c456485b5146fa07b76c2");
   params.append("client_secret", "9420db774a6348a5a94e5a40685b35d4");

   fetch(url, {
      method: "POST",
      headers: {
         "Content-Type": "application/x-www-form-urlencoded",
      },
      body: params.toString(),
   })

   .then(function(keyData){
      console.log(keyData.json())
   })


Then version of getSpotKey (doesn't work in serperate funtion )
async function getSpotKey(){
   let key; 

   const url = "https://accounts.spotify.com/api/token";

   //Strings together URL in correct format so I don't have to 
   const params = new URLSearchParams();
   params.append("grant_type", "client_credentials");
   params.append("client_id", "2b04a417936c456485b5146fa07b76c2");
   params.append("client_secret", "9420db774a6348a5a94e5a40685b35d4");

   fetch(url, {
      method: "POST",
      headers: {
         "Content-Type": "application/x-www-form-urlencoded",
      },
      body: params.toString(),
   })
   .then(function(keyData){
      return(keyData.json());
   })
   .then(function(parsed){
      console.log(parsed.access_token);
      key = parsed.access_token; 
   })
   // console.log(key); 
   return(key);
}


Post Request Spotify Outline: 

curl -X POST "https://accounts.spotify.com/api/token" \
     -H "Content-Type: application/x-www-form-urlencoded" \
     -d "grant_type=client_credentials&client_id=your-client-id&client_secret=your-client-secret"

