var delayBetween = 5000;
var numTries = 10000;
var i = 1;
var docRoot = document.querySelectorAll("sa-product-detail")[0].root;
var targetBBB = docRoot.querySelectorAll("div.productTitle[aria-label*='Bibbidi'] .productTitleHeader");
var targetTitle = targetBBB[0].innerText;
var targetConfirmButton = docRoot.getElementById("confirmButton");

alert(" " + targetTitle + "\n WDW Reservation Script Enabled\n Searches will run every " + (delayBetween / 1000) + " seconds.\n If a time slot becomes available\n a high pitched beep will sound to\n alert you to look at the screen.");

/* setup search */
function searchForReservation() {
	setTimeout(function() {
		var docRoot = document.querySelectorAll("sa-product-detail")[0].root;
		if(!document.querySelector("sa-time-slot-selection").root.querySelector("sa-option-selection #optionComponent #noAvailability")){
			console.log("FOUND AVAILABILITY!!!!");
			beep(500, 900, 999999);
			i = numTries;
		} else {
			console.log("searching " + targetTitle + "...");
			document.querySelector("sa-party-mix-selection").root.getElementById("sa-party-mix-selection").root.getElementById("confirmButton").click();
			document.querySelector("sa-time-slot-selection").root.querySelector("sa-option-selection #optionComponent #noAvailability").innerText = ("Search Times (" + i + " of " + numTries + ")");
			i++;
			if (i < numTries) {
				searchForReservation();
			}
		}
	}, delayBetween);
}

/* setup audio function */
a=new AudioContext();
function beep(vol, freq, duration){
	v=a.createOscillator();
	u=a.createGain();
	v.connect(u);
	v.frequency.value=freq;
	v.type="square";
	u.connect(a.destination);
	u.gain.value=vol*0.01;
	v.start(a.currentTime);
	v.stop(a.currentTime+duration*0.001);
}

/* start search */
searchForReservation();