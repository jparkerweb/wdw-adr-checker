# wdw-adr-checker
Advance Dining Reservation checker for Walt Disney World is a `bookmarklet` you can install in your browser to help you find those sought after ADR's to popular restaurants.

## Follow these steps to add and run the ADR Bookmarklet

### Install the ADR Bookmarklet:
- create a bookmark from any page
- edit the bookmark  
  - update name field to something descriptive (eg: ADR Checker)
  - update URL filed to:  
  ```javascript: var delayBetween = 5000;var numTries = 10000;var i = 1;var targetADR = document.querySelectorAll(".entity-details finder-title.title")[0].innerText;alert(" " + targetADR + "\n WDW ADR Script Enabled\n Searches will run every " + (delayBetween / 1000) + " seconds.\n If a time slot becomes available\n a high pitched beep will sound to\n alert you to look at the screen.");function searchForADR() {setTimeout(function() {if(document.querySelectorAll(".availability finder-button").length > 0 ){console.log("FOUND AVAILABILITY!!!!");beep(500, 900, 999999);i = numTries;} else {console.log("searching " + targetADR + "...");document.getElementById("search-time-button").click();document.querySelector("#search-time-button button").innerText = ("Search Times (" + i + " of " + numTries + ")");i++;if (i < numTries) {searchForADR();}}}, delayBetween);}a=new AudioContext();function beep(vol, freq, duration){v=a.createOscillator();u=a.createGain();v.connect(u);v.frequency.value=freq;v.type="square";u.connect(a.destination);u.gain.value=vol*0.01;v.start(a.currentTime);v.stop(a.currentTime+duration*0.001);}searchForADR();```
  - screenshot for reference:  
    ![Edit Bookmark Screenshot](screen-shot.png)

### Run the ADR Bookmarklet
