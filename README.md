# 🏰🌐🎬🌳 wdw-adr-checker
Advance Dining Reservation checker for Walt Disney World is a `bookmarklet` you can install in your browser to help you find those sought after ADR's to popular restaurants.  It will run in a browser tab, checking for your desired ADR availability every 5 seconds, and notify you with an audible tone and message when one is found.

## Follow these steps to add and run the ADR Bookmarklet

### Install the ADR Bookmarklet:
- create a bookmark from any page
- edit the bookmark  
  - update name field to something descriptive (eg: ADR Checker)
  - update URL filed to:  
  ```javascript: var delayBetween = 5000;var numTries = 10000;var i = 1;var targetADR = document.querySelectorAll(".entity-details finder-title.title")[0].innerText;alert(" " + targetADR + "\n WDW ADR Script Enabled\n Searches will run every " + (delayBetween / 1000) + " seconds.\n If a time slot becomes available\n a high pitched beep will sound to\n alert you to look at the screen.");function searchForADR() {setTimeout(function() {if(document.querySelectorAll(".availability finder-button").length > 0 ){console.log("FOUND AVAILABILITY!!!!");beep(500, 900, 999999);i = numTries;} else {console.log("searching " + targetADR + "...");document.getElementById("search-time-button").click();document.querySelector("#search-time-button button").innerText = ("Search Times (" + i + " of " + numTries + ")");i++;if (i < numTries) {searchForADR();}}}, delayBetween);}a=new AudioContext();function beep(vol, freq, duration){v=a.createOscillator();u=a.createGain();v.connect(u);v.frequency.value=freq;v.type="square";u.connect(a.destination);u.gain.value=vol*0.01;v.start(a.currentTime);v.stop(a.currentTime+duration*0.001);}searchForADR();```
  - screenshot for reference:  
    ![Edit Bookmark Screenshot](/edit-bookmark.png)

### Run the ADR Bookmarklet
- navigate to the "Check Availability" page for a restaurant you want to make a reservation for
- change the date, time, and party size to your desired settings
- now simply click the bookmark you created above to start your search
- your reservation search will run every 5 seconds
- keep your browser (and this tab) open in the background while using your computer
- once an advanced dining reservation is found your browser will emit a long audible beep to alert you
- now quickly make reservation before someone else takes it

----

#### Demo of searching for Space 220 Lounge availability
![Bookmarklet in action example](/adr.gif)


---

### Bibbidi Bobbidi Boutique (BETA)
```javascript: var delayBetween = 5000;var numTries = 10000;var i = 1;var docRoot = document.querySelectorAll("sa-product-detail")[0].root;var targetBBB = docRoot.querySelectorAll("div.productTitle[aria-label*='Bibbidi'] .productTitleHeader");var targetTitle = targetBBB[0].innerText;var targetConfirmButton = docRoot.getElementById("confirmButton");alert(" " + targetTitle + "\n WDW Reservation Script Enabled\n Searches will run every " + (delayBetween / 1000) + " seconds.\n If a time slot becomes available\n a high pitched beep will sound to\n alert you to look at the screen.");function searchForReservation() {setTimeout(function() {var docRoot = document.querySelectorAll("sa-product-detail")[0].root;if(!document.querySelector("sa-time-slot-selection").root.querySelector("sa-option-selection #optionComponent #noAvailability")){console.log("FOUND AVAILABILITY!!!!");beep(500, 900, 999999);i = numTries;} else {console.log("searching " + targetTitle + "...");document.querySelector("sa-party-mix-selection").root.getElementById("sa-party-mix-selection").root.getElementById("confirmButton").click();document.querySelector("sa-time-slot-selection").root.querySelector("sa-option-selection #optionComponent #noAvailability").innerText = ("Search Times (" + i + " of " + numTries + ")");i++;if (i < numTries) {searchForReservation();}}}, delayBetween);}a=new AudioContext();function beep(vol, freq, duration){v=a.createOscillator();u=a.createGain();v.connect(u);v.frequency.value=freq;v.type="square";u.connect(a.destination);u.gain.value=vol*0.01;v.start(a.currentTime);v.stop(a.currentTime+duration*0.001);}searchForReservation();```

run the bookmarklet once you have chosen your date and number of guest and also have a message under the `Select a Time` section saying "There are no available times for DATE...":

![no times available example](/bbb-no-times.png)

