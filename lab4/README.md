Lab 4 notes: 

https://foderj.eastus.cloudapp.azure.com/ITWS-2110-F24-foderj/lab4



Plan: 
   Only pick a subset of the functionality to make because we only have 50 mins. 
   Only Chat GPT and must explicitly say when stiching together 
   MUST HAVE NO RED FLAGS ON ZAP -> upload the report 


My Subset: Dynamically changing page based on user interactions
   I plan on my subset being focusing on dynamic changes to what is displayed on the page based on user interactions. I want to have an initial page that has a "click to fetch API's button". I want this button to have functionality. Once I get to the main page, I want to be able to have a dropdown bar to switch between schools, include the same schools as original (RPI, Clemson, Umiami), along with a more info button that actually changes what is displayed. 
   
   I set a 50min timer for actually working on the website and got the functionality as close to my actual website as I could. 

Prompt log (I used chatGPT the entire time): 

Prompt 1: Write a seperate php file and CSS script to make a website page that looks like this
   *included back.png* (lab4/resources) 
How I used it: Created the files in my repo and pasted in the .php and .css. Made a resources folder for the css

Prompt 2: The styles.css is in a folder called 'resources' change entire php file accordingly
How I used it: Literally just replaced index.php with new index.php
 
Prompt 3: change foden sites to fodera sites
How I used it: Literally just replaced index.php with new index.php

Prompt 4: Create an initial page in which basically everything currently in index.php is hidden. All that should appear is a button that says  "click to fetch from API's!". Once that button is clicked everything that was hidden in index.php whould appear. Write a new backend javascript file (also in the resources folder), along with updating the current css and php files to complete this task. The initial page I am describing that had the button should look like the image I provided
   *included init.png* (lab4/resources) 
How I used it: Copied and pasted everything in, also created new js file in resources, matching the name given to me by chatgpt 

Prompt 5: I'm going to refer to the page that shows up after you click the API's button as page 2
How I used it: -

Prompt 6: On page 2, add a dropdown menu with 3 options, RPI, Clemson, Umiami
How I used it: Copied and pasted everything in, added the new css to the bottom of existing 

Prompt 7: Center this dropbox at the top of the page, above the current weather and suggested spotify playlists
How I used it: Deleted old dropbox section of CSS and replaced it with new, Updated entire index.php

Prompt 8: Why did the show more info button go away, Add it back!
How I used it: Concatenaated new section to the styles.css, updated the index.php with a full copy and paste

Prompt 9: Put the Pick a school button and description on a higher row than the current weather and suggested spotify playlists. Put the show more info Button on a lower row than the current weather and suggested spotify playlists. 
How I used it: Pasted in only the index.html 

Prompt 11: list what the entire css file should currently be
How I used it: pasted in whole new css 

Prompt 12: When I click the show more info button, for the weather section show the "feels like", 'min temp', and 'max temp'. For the spotify section, show an author for each entry along with an image of the playlist. Just make up random 'placeholder values' for these fields. 
How I used it: Whole new index.php, 

Prompt 13: give me the full js file 
How I used it: added new file called backend.js

Prompt 14: should backend.js be a new file 
How I used it: - 

Prompt 15: scripts.js should still exist tho
How I used it: - 

Prompt 16: When I put all of these together, the click to show API button is gone, add it back
How I used it: Whole new index.php file 

Prompt 17: add links to actual image files across the web to curate the page, also this extra info should only appear when I click the show more info button. When it is clicked the button should then read show less info, when that is clicked the info should go away. It should act as a toggle. 
How I used it: New index.php and backend.js 

Prompt 18: Now connect the extra info associated with the spotify playlists to the same button 
How I used it: New index.php and backend.js 

Prompt 19: When the user changes the pick a school dropdown, update the title shown on the page and the title of the tab accordingly 
How I used it: New backend.js

Prompt 20: When the user changes the dropdown menu, also change the placeholder data in Current weather and spotify playlist accordingly
How I used it: new Backend.js



Citations:
   https://chatgpt.com

