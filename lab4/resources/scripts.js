document.addEventListener("DOMContentLoaded", function() {
   const fetchButton = document.getElementById("fetchButton");
   const contentSection = document.getElementById("contentSection");

   fetchButton.addEventListener("click", function() {
       // Remove the hidden class to display the content
       contentSection.classList.remove("hidden");
       // Optionally, you can also hide the button after clicking
       fetchButton.style.display = "none";
   });
});
