// require('fuzzy-dropdown');

// Subesh's JS code

$(function () {
    // the array below is hardcoded but there is probably a way to get this from the database
    var services = ["Account Opening",
        "Account Closure",
        "Account Update", 
        "Closure Cash Withdrawal",
        "Closure Advice Withdrawal",
        "ATM Card Issuance",
        "ATM Card Replacement",
        "Debit Card Issuance",
        "Debit Card Replacement",
        "Activate Debit Card",
        "Activate ATM Card",
        "Update ATM Card",
        "Update Debit Card",
        "Apply for Digibank",
        "Statement Request",
        "Tokens Replacement",
        "Update Address",
        "Update Email",
        "Update Particulars",
        "Update Phone",
        "Current/Savings Account",
        "Overseas Remittance",
        "Foreign Currency Current Account"];
    
    // JQuery's autocomplete function

    // function to redirect to the appropriate time-estimate page
    // function showResult(event, ui) {
    //     window.location.replace(`http://127.0.0.1:3000/services/${index}/time_estimate`);
    // }

    // $('#myInput').change(function () {
    //     window.location = "services/+ $('#myInput').val() +/time_estimate";
    // });


    $("#myInput").autocomplete({
        source: services,
        autofocus: true
        // select: function (event, ui) {
            
        // } // need to implement the "showResult" function, I think similar to your "query" function
    }).data("ui-autocomplete")._renderItem = function( ul, item ) {
        let txt = String(item.value).replace(new RegExp(this.term, "gi"), "<b>$&</b>");
        //find index of service in services array
        let index = services.indexOf(item.value);
        console.log(index);

        return $("<li></li>")
            .data("ui-autocomplete-item", item)
            .append("<a href='services/" + String(index+2) + "/time_estimate'>" + txt + "</a>")
            .appendTo(ul);
        };
});
    
// Getter
var autoFocus = $( "#myInput" ).autocomplete( "option", "autoFocus" );
 
// Setter
$("#myInput").autocomplete("option", "autoFocus", true);


// Jeff's JS code

var timeout = null;

function check_timeout() {
  clearTimeout(timeout);
  timeout = setTimeout(filterFunction(), 10000);
}

async function filterFunction() {
    var input, filter, div, a
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    div = document.getElementById("results");
    ul = document.getElementsByTagName("ul");
    console.log(ul);
    //apend "a" to ul
   
  
    // setInterval(function () {
    
    //     if (input === document.activeElement) {
    //         div.style.display = "block";
    //         console.log('set to block')
    //         if (input.value.length < 3) {
    //             div.style.display = "none";
    //         }
    //     } else {
    //         div.style.display = "none";
    //         console.log('set to none')
    //     }
    // }, 1000);

    searchDict = await query(input.value);
    console.log(searchDict);
    li = document.createElement("li");
    // check_timeout();
    li.innerText = "------Do you mean-------";
        //delay for 10 seconds
    ul[0].appendChild(li);

  id = searchDict["top_5_index"];
  services = searchDict['top_5_services'];
  // console.log(services);
  await new Promise(resolve => setTimeout(resolve, 100));
    for (i = 0; i < 5; i++) {
        li = document.createElement("li");
        li.innerText = services[i];
        //delay for 10 seconds
        ul[0].appendChild(li);
    //   index = String(i);
    //   service = services[i];
    //   a = document.getElementById(String(i+1));
    //   a.innerText = service;
    //   a.href = time_estimate_url(service);
    }
}
// set a timeout 
var timeout = 0
function query(inp) {
  // implement getrequest
    if (timeout > 3000) {
        timeout = 0 // reset timeout
        return fetch('http://127.0.0.1:5000/predict?query=' + inp)
            .then(response => response.json());
    }
}