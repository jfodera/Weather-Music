Lab 6 Notes (UI/UX): 

All work done on finder (group project) ->  https://finder.eastus.cloudapp.azure.com/finder 

Note to Grader: this is the best way I could figure out how to format, links are clickable if you copy and paste the text section below into VS code. 

```txt
Lenses of User Experience: 


   Useful: 
      Mapping Laws: 
         Doherty Threshold-> Productivity soars when a computer and its users interact at a pace (<400ms) that ensures that neither has to wait on the other.
            When building an application, ensuring it runs efficiently is very important to the user experience as the faster it runs, the more 
            productive the user will 
            be and the more useful the application is. 

         Miller’s Law -> The average person can only keep 7 (plus or minus 2) items in their working memory.
            The application doing what it needs to do without require too much out of the user increases it's usefullness. 

         Pareto Principle -> The Pareto principle states that, for many events, roughly 80% of the effects come from 20% of the causes.
            Make the best aspects of your websites the ones that the user will actually use. 

         Von Restorff Effect -> The Von Restorff effect, also known as The Isolation Effect, predicts that when multiple similar objects are present,
          the one that differs from the rest is most likely to be remembered.
            Isolating the item you will most likely need increases the usability of the application. 

      What I observe: 
         In its current state, I wouldn't deem our application as useful because it does not yet complete the task it is intended to do. Although, 
         there are defintley 
         usefull components related to it, as there is an IAM send up and operations for MFA set in place. It also has a dashboard and a good view of what 
         is in the database. There are usefull aspects but does not currrently reach main goal. 

      Areas of Success: 
         Can log in and correctly identify yourself (neccesary for finfing a lost item). 
         Runs efficiently, longest thing reload takes is sending the verificaiton email and thats less that 0.4ms 
         Items needed are isolated and centeres on page, for example the logina nd register buttons on the home page

      Opportunities for Imporovement: 
         Actually make the goal functionality work (match users to their lost items)
         make found item submission go to the database 
         Improve dashboard layout for recorders-> make it more even and seperate lost and found
         fix login not found user feedback 

      Implementation: 
            Issue Link: https://github.com/RPI-ITWS/ITWS-2110-F24-Find-er/pull/134
            Description: 
               Originally, the found item submission that recorders were supposed to be able to make did not actually make it to the database as 
               they werent configured. This is now fixed. This is related to the Pareto Principle as it makes the application more useful by making the
               thing that the users will actually use, work. 
            
         
          
   

   Desireable: 
      Mapping Laws: 
         Aesthetic-Usability Effect -> Users often perceive aesthetically pleasing design as design that’s more usable.
            The better it looks, the more people are going to want it. 

         Flow -> The mental state in which a person performing some activity is fully immersed in a feeling of energized focus, full involvement, and 
         enjoyment in the process of the activity.
            Providing neccesary feedback on things is one area that would improve desireability as it ensures good flow. The more Immersed a user is, the more 
            desireable the application 

         Goal-Gradient Effect-> The tendency to approach a goal increases with proximity to the goal.
            Keeping users aware to how close they are to said goal with increase how Desireable they think the website is as it will keep them invested in the 
            task 

         Zeigarnik Effect -> People remember uncompleted or interrupted tasks better than completed tasks.
            If you want as user to complete a task, include progress tracker so they want to complete, thus increasing how much they value said task. 
      

      What I observe: 
         Overall I think the desirability of our website is high just by the idea. Our target user is someone who has lost something, and in turn 
         someone who looses something is going to desire an application that can help them find it. We also have good, consistent theme throughout 
         the website which would make a user more inclined to use our application. We could get better at providing the user with certain feedback. 


      Areas of Success: 
         Constant header
         modern logo, design which adds to the Aesthetic (doesn't look like a 2000's website)
         Provides alright feedback on login errors (Could be better)

      Opportunities for Imporovement:
         Better user feedback within the login system
         Highlight everything the user hovers over
         Notify user when found item form and lost item form is succesfully submitted
         send email when Items are matched 
         make the about page a bit nicer
         colors on safari 
         When token is expired on link (because they alread sent one), tell them
         remove cooldown for found item logging 

      Implementation: 
         Issue Link: https://github.com/RPI-ITWS/ITWS-2110-F24-Find-er/pull/125/commits
         Description: 
            When the user initially signed in, an email verification that they were required to respond to was automatically send with no notification to them. 
            This helps the overall flow of the website, increasing it's desireabillity as the user is provided neccesary feedback. 


   

   Valuable:
      Mapping Laws:  
         Cognitive Load -> The amount of mental resources needed to understand and interact with an interface.
            Having extraneous cognitive load in which the user isn't actually understanding the content of the interface in turn decreases the value of the 
            site, as the 
            user is going there to get something. A simple site that gets the point across is valueable to the user. 
         
         Hick’s Law -> The time it takes to make a decision increases with the number and complexity of choices.
            The faster the user can complete the task they came to the application for, will increase how valueable they think the application is (in most 
            cases)

         Law of Prägnanz -> People will perceive and interpret ambiguous or complex images as the simplest form possible, because it is the interpretation 
         that requires the least cognitive effort of us.
            The simpler an application and aspects of it are made to be, the more valuable said application will be to the user. 

         Parkinson’s Law -> Any task will inflate until all of the available time is spent.
            Make a task take as long as the user thinks it should take, if these expectation match, the application is more valuable 

         Working Memory -> A cognitive system that temporarily holds and manipulates information needed to complete tasks.
            Placing the burden of memory on the system and not the user will make the application much more valueable to the user. 
         
         Zeigarnik Effect -> People remember uncompleted or interrupted tasks better than completed tasks.
            If you want as user to complete a task, include progress tracker so they want to complete, thus increasing how much they value said task. 

      What I observe: 
         The simple layout of our website helps get the task the user is looking for done quickly, increasing value. Our time management is also 
         pretty good as it is not a heavy site. There is no constant notification of uncompleted tasks which is something that would be helpful. 


      Areas of Success: 
         Our website is simple, you only have what you need, no extraneous buttons
         forms submit in the amount of time you think they would, this is helped by cloudinary
         Once the user enters information regarding where they lost the item, it takes the burden off of them for remembering specifics
      

      Opportunities for Imporovement:
         Progress bar as moving through item submission form
         decrease verification email sending time 
         Mobile support 
         CSS compressor
         cant go to login if already logged in


      Implementation: 
         Issue Link: https://github.com/RPI-ITWS/ITWS-2110-F24-Find-er/pull/127
         Description:
            Now when users are moving through the form to submit an item, there are able to see how many pages deep in the form they are. This 
            goes in hand with the Zeigarnik Effect, presenting progress to the user, which will greatly improve their view of the project as valuable. 
         

   Accessible:
      Mapping Laws:  
         Fitts’s Law -> The time to acquire a target is a function of the distance to and size of the target.
            While this could be agrued for many lenses, it fits here as well. If things like touch targets are too small for some visually impaired users to 
            see (as a high percentage of people are), it greatly hinders the accessibility of the website, greatly cutting down the population of people that 
            can actually use it. 

         Paradox of the Active User -> Users never read manuals but start using the software immediately.
            Users are not going to waste time studying how to use your website and must keep this in mind while building it. Keep it simple enough so that 
            anyone can navigate it (if anyone is your target audience). 

         Postel’s Law ->   Be liberal in what you accept, and conservative in what you send.
            Preparing for as many inputs as possible will increase the overall accessibility of the application 

      What I observe: 
         The main thing I looked for was alt tags and we have all of that there. Buttons are large and simple build is easy to navigate. COuld have some 
         improvements
         with the dashboard layout. Also need to manage Lost/found submission forma a bit better other than that looking pretty good. 


      Areas of Success: 
         All of our images have alt tags
         Siplicity of site helps for anyone to be able to nagigate 
         buttons are a good size, nothing is too small 
      

      Opportunities for Imporovement:
         For the forms, you can pretty much input anything, not a lot of input control
         Can make reporting Lost item button on dashboard a bit larger 
         have actual image submitted show in your dashboard


      Implementation: 
         Issue Link: https://github.com/RPI-ITWS/ITWS-2110-F24-Find-er/pull/130
         Description:   
            Prevents from small, non-descriptive inputs of items. This plays into Postel’s Law as it prepares for a wide range of inputs. 
            Preparing for more cases increases the acsessibility of the application.

      


   Credible:
      Mapping Laws: 
         Mental Model -> A compressed model based on what we think we know about a system and how it works
            If you can get the user to have a mental model of the application and what it's purpose is, as long as the application is not malicous, this will 
            increase the 
            credibility of the application as it is showing directly that it has nothing to hide. 

         Peak-End Rule -> People judge an experience largely based on how they felt at its peak and at its end, rather than the total sum or average of every 
         moment of the experience.
            first impressions and how you leave off are everything. Ensuring that the first thing a user sees provides a sense of safety/credibility will help 
            their perception
            of the credibility of the applicaiton 

         Tesler’s Law -> Tesler’s Law, also known as The Law of Conservation of Complexity, states that for any system there is a certain amount of complexity 
         which cannot be reduced.
            For certain goals, there are tasks in which you cannot abstract away without reducing the credibility of the application, must keep this in mind 
            through development. 


      What I observe: 
         As unbiasly as I can say, the general feel when you log onto the site is that it doesn't have any malicous intent. You can see everything it's trying 
         to do for you and all it does is ask you to log in so not much to steal there. Defintley some backend improvements to make in order to ensure that. 


      Areas of Success: 
         Mission is stated blatantly with nothing malicous within 
         Goal is a good purpose and doesn't sound like we are hiting anything 
         the first thing you see on the homepage is telling the user exactly what we want to do for them 
      
      Opportunities for Imporovement:
         Prevent against cross site scripting 
         Implement other forms of MFA
         Create and Improve message for when we have found their item 
         a way to delete your account 
         fixsubmission cooldown 


      Implementation:
         Issue Description: https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://docs.vultr.com/how-to-disable-directory-browsing-on-apache&ved=2ahUKEwjn-oejgeCJAxU1VjUKHY_zGXcQFnoECBIQAQ&usg=AOvVaw3MdKNdSGiK3UhburT2rILd
         Description: 
            Helped to prevent against cross site scripting, making the application more secure. Did this mainly in VM by messing with directory settings in 
            the configuration file. There were no github changes made here. Increasing the safety of the application, in turn makes it more credible as 
            it helps to prevent malicious edits. 

      
         

   Findable: 
      Mapping Laws: 
         Cognitive Bias -> A systematic error of thinking or rationality in judgment that influence our perception of the world and our decision-making 
         ability. (think like the user) 
            If the designer is constantly thinking like the user when designing their site (Bias's and all), the user will have an easier time finding things. 

         Law of Common Region -> Elements tend to be perceived into groups if they are sharing an area with a clearly defined boundary.
            Percieving items to click on as being in common groups allows for easier naviagtion in finding what the user actually wants to find.c

         Law of Proximity -> Objects that are near, or proximate to each other, tend to be grouped together.
            Yet again, similiar objects being located nearest to eachother makes them more finable as they are placed in groups. 

         Selective Attention -> The process of focusing our attention only to a subset of the stimuli in the environment — usually those related to our goals.
            Keeping Users focus on the tasks they need to in order to complete the goal requires increasing the finability of these tasks. 

         Serial Position Effect -> Users have a propensity to best remember the first and last items in a series.
            Users are going to look at the first and last of a list so place the most important items there. 

      What I observe: 
         The simplicity defintley helps with the findability of our web-app. Everything we would need to navigate to is pretty clearly layed out. 
         Could be some better grouping in the navbar as everything looks pretty much the same. But other than that you can naviagate anywhere pretty well. 


      Areas of Success: 
         Not overcrowding user, very minimal design 
         Everything you need group together in the NAvbar 
         Main thing you should have attention on is in the center of the page. 
      
      Opportunities for Imporovement:
         Could change the color of found and lost tabs in recorder view tobe the same 
         What if recorders loose something, add found item tab for them
         Make logo in topleft actually say finder so it is more noticably as a back button


      Implementation: 
         Issue Link: https://github.com/RPI-ITWS/ITWS-2110-F24-Find-er/pull/132
         Descriptions: 
            If recorders loose something, they can now file a lost item request. Before this edit, there was no button that actually took recorders to the 
            link to do this, now that the button is implemented, they can travel there. Falls into Cognitive Bias as if a recorder user needs to submit a lost 
            item form, I thought about where they would want to look for it and put it there. 
         


   Usable:
      Mapping Laws: 
         Chunking -> A process by which individual pieces of an information set are broken down and then grouped together in a meaningful whole.
            Chunking of data makes it easier for users to process what they are seeing and navigate the website. 

         Jakob’s Law -> Users spend most of their time on other sites. This means that users prefer your site to work the same way as all the other sites they 
         already know.
            The more consistent your site is with others, the easier of a time a user will have actually using it as it is similar to what they already know. 

         Law of Similarity -> The human eye tends to perceive similar elements in a design as a complete picture, shape, or group, even if those elements are 
         separated.
            Making things that are not the same look different is vital creating application that is useable as it decreases the chances of users being 
            confused

         Law of Uniform Connectedness -> Elements that are visually connected are perceived as more related than elements with no connection.
            Yes again, similar elements should have similar appearences as this makes the application more usable. 

         Occam’s Razor -> Among competing hypotheses that predict equally well, the one with the fewest assumptions should be selected.
            Make things as simple as possible while still completing the desired function, doing so will make the site easier to use. 

      What I observe: 
         For a unfinished product we are pretty usable. Tune ups in the navbar, email verification system, and notification system are due but those also 
         are incomplete parts of the website so taken with a grain of salt. The fact that we can actually make submissions and view the database is pretty 
         nice. 


      Areas of Success: 
         Login Works along with the signup 
         Can actual make lost item submission 
         Keeps site conventions pretty normal, top left home ect. 
      

      Opportunities for Imporovement:
         Have verification email send for MFA recorders 
         Doesn't email you if item is found, it should 
         could make navbar highlight a bit better when your hovering over something (showing you what you selected) 
         remove recorder ID from lost items
   
      Implementation: 
         Issue Link: https://github.com/RPI-ITWS/ITWS-2110-F24-Find-er/pull/124/commits
         Description: 
            Before recorders were unable to verify their email, leaving them unable to acsess the application. This fits into Occam’s Razor as recorders 
            now do not even have to click a button to recieve a verification email, making it much simpler for them to login and acsess the dashboard as 
            before they would have to disguise as a user if they wanted to. 

                  
 



 Citations: 
   Moreville deeper understanding: https://www.uxpin.com/studio/blog/ux-honeycomb-definition-and-use/
   Laws: https://lawsofux.com
   Directory Browsing: https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://docs.vultr.com/how-to-disable-directory-browsing-on-apache&ved=2ahUKEwjn-oejgeCJAxU1VjUKHY_zGXcQFnoECBIQAQ&usg=AOvVaw3MdKNdSGiK3UhburT2rILd



Things I learned: 
   in order to use .env on xamp, installed composer using brew
   transaction and rollback for sql statements
   try + catch on all DB errors


   For item/lost form submission: 
      When hits submit, js function is called, checks inputs, makes sure good, and then fetches the php 'lostformhandler' file, 
      if lost form works correctly, the response will be in a JSON data echo, going back to js function which then redirects initial page to the dash. 


```