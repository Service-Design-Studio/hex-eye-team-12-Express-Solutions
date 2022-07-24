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
    function showResult(event, ui) {
        // window.location.replace("http://127.0.0.1:3000/services/20/time_estimate");
    }


    $("#myInput").autocomplete({
        source: services,
        autofocus: true,
        select: showResult
    }).data("ui-autocomplete")._renderItem = function( ul, item ) {
        let txt = String(item.value).replace(new RegExp(this.term, "gi"),"<b>$&</b>");
        return $("<li></li>")
            .data("ui-autocomplete-item", item)
            .append("<a>" + txt + "</a>")
            .appendTo(ul);
    };
});
    
// Getter
var autoFocus = $( "#myInput" ).autocomplete( "option", "autoFocus" );
 
// Setter
$("#myInput").autocomplete("option", "autoFocus", true);


// Jeff's JS code

// var timeout = null;

// function check_timeout() {
//   clearTimeout(timeout);
//   timeout = setTimeout(filterFunction(), 10000);
// }

// async function filterFunction() {
//   var input, filter, div, a
//   input = document.getElementById("myInput");
//   filter = input.value.toUpperCase();
//   div = document.getElementById("results");
  
//   setInterval(function() {
    
//     if(input=== document.activeElement) {
//         div.style.display = "block";
//         console.log('set to block')
//         if (input.value.length < 3) {
//           div.style.display = "none";
//           }
//     } else {
//           div.style.display = "none";
//           console.log('set to none')
//       }
//   }, 1000);

//   searchDict =  await query(input.value);
//   // console.log(searchDict);
//   id = searchDict["top_5_index"];
//   services = searchDict['top_5_services'];
//   // console.log(services);
  
//     for (i = 0; i < 5; i++) {
//       index = String(i);
//       service = services[i];
//       a = document.getElementById(String(i+1));
//       a.innerText = service;
//       a.href = time_estimate_url(service);
//     }
// }

// function query(inp) {
//   // implement getrequest
//   return fetch('http://127.0.0.1:5000/predict?query='+inp)
//   .then(response => response.json());
// }