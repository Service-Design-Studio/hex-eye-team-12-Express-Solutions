function check(){
  var input = document.getElementById("myInput");
  var popup = document.getElementById("displayText");

  let ul= document.getElementsByTagName('ul')
 
  if (ul[0].style.display ==='none' && input.value.length > 0 && document.activeElement === input) {
    popup.style.visibility = "visible";
    console.log("Popup")

  } else{

    popup.style.visibility = "hidden";
    
  }

}
setInterval(check,3000)

// function debounce(func, delay)  { 

//   let debounceTimer 


//   return function() { 

//       const context = this

      

//           clearTimeout(debounceTimer) 

//               debounceTimer  = setTimeout(() => func.apply(context), delay) 

//   } 
// }  


// function wrapper() {
//   let output = filterFunction();
//   var input, filter, div
//   input = document.getElementById("myInput");
//   // console.log("Input: " + input.value);
//   filter = input.value.toUpperCase();
//   div = document.getElementById("results");
//   ul = document.getElementsByTagName("ul");  // where is the element with tagname "ul"?
// }


// function check() {
//   var input = document.getElementById("myInput");
//   var popup = document.getElementById("displayText");

//   let ul= document.getElementsByTagName('ul')
//   //input is focus 
  
//   if (ul[0].style.display ==='none' && input.value.length > 0 && document.activeElement === input) {

//     popup.style.visibility = "visible";
//   } else{

//     popup.style.visibility = "hidden";
   
//   }

// }

 
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

$(document).on("keypress", "input", function(e){
  if(e.which == 13){
      console.log("Enter")
      go()
    }
  })
setInterval(check,2000)
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
  $("#myInput").autocomplete({
      source: services,
      autofocus: true
  }).data("ui-autocomplete")._renderItem = function( ul, item ) {
      let txt = String(item.value).replace(new RegExp(this.term, "gi"), "<b>$&</b>");
      //find index of service in services array
      let index = services.indexOf(item.value);
      // console.log(index);

      return $("<li></li>")
          .data("ui-autocomplete-item", item)
          .append("<a href='services/" + String(index+2) + "/time_estimate'>" + txt + "</a>")
          .appendTo(ul);
      };
});


function go(){
  console.log("go")
  let input = document.getElementById("myInput");
  //redirect to link 

  //if input.value in services array 
  value = input.value
  console.log("value: " + value)

  // loop through services and check if value is in services array
  for (var i = 0; i < services.length; i++) {
    if (services[i] == value) {
      console.log(services[i])
      let index = services.indexOf(input.value);
      window.location.href = "http://127.0.0.1:3000/services/"+ String(index+2)+"/time_estimate"
    }
  }
}
async function filterFunction() {
 
  var input, filter, div
  input = document.getElementById("myInput");
  // console.log("Input: " + input.value);
  filter = input.value.toUpperCase();
  ul = document.getElementsByTagName("ul")
  console.log(ul)
  searchDict = await query(input.value);
  // console.log("S:" + searchDict);
  
  id = searchDict["top_5_index"];
  services = searchDict['top_5_services'];
  // await new Promise(resolve => setTimeout(resolve, 300));
  
  if (ul['ui-id-1'].style.display === "block") {
    return true

    } else { // if the list is not visible, show it
      console.log("no auto complete")
      while (ul['ui-id-1'].firstChild) {
        ul['ui-id-1'].removeChild(ul['ui-id-1'].firstChild);
    }
    while (ul[0].firstChild) {
      ul[0].removeChild(ul[0].firstChild);
    }
    li = document.createElement("li");
    // hr = document.createElement("hr");
    // hr.style = "margin-top: 2px; margin-bottom: 2px;";

    // ul['ui-id-1'].appendChild(hr);
    li.innerText = "Services you may like";
    //set inner text as bold
    // center text
    li.style = "text-align: center;";
    li.style.fontWeight = "bold";
    //set inner text as italic 
    li.style.fontStyle = "italic";
    ul['ui-id-1'].appendChild(li);

    let divResult = document.getElementById('results')
    console.log(divResult);
    divResult.appendChild(ul['ui-id-1'])
    ul['ui-id-1'].style.position = "absolute";
    
    
    console.log( ul)
    for (i = 0; i < 5; i++) {
      let index = id[i];
      $('<li class="ui-menu-item" id="ui-id-6" tabindex="-1"></li>')
          .data("ui-autocomplete-item", services[i])
          .append("<a href='services/" + String(index+2) + "/time_estimate'>" + services[i] + "</a>")
          .appendTo(ul['ui-id-1']);
    }
    if (ul['ui-id-1'].childElementCount > 0 ) {
    ul['ui-id-1'].style.display = "block";
   
    
 
    //set ul position to the dev result position 
    // ul['ui-id-1'].style.position = "relative";
    // ul[0].style.position = "relative";
  
    
    
  }
   

  }
  
}


function query(inp) {
// implement getrequest
  
      return fetch('http://127.0.0.1:5000/predict?query=' + inp)
          .then(response => response.json());
  
}

