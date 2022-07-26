// function debounce(func, wait) {
//     let timeout;
//     console.log(wait)
//     console.log(func)
  
//     return () => {
//       const later = () => {
//         input = document.getElementById("myInput")
//         clearTimeout(timeout);
//         func
//       };
  
//       clearTimeout(timeout);
//       console.log(later)
//       timeout = setTimeout(later, wait);
//     };
//   };

function debounce(func, delay)  { 

  let debounceTimer 


  return function() { 

      const context = this

      

          clearTimeout(debounceTimer) 

              debounceTimer  = setTimeout(() => func.apply(context), delay) 

  } 
}  


function wrapper() {
  let output = filterFunction();
  var input, filter, div
  input = document.getElementById("myInput");
  // console.log("Input: " + input.value);
  filter = input.value.toUpperCase();
  div = document.getElementById("results");
  ul = document.getElementsByTagName("ul");  // where is the element with tagname "ul"?
}
// if input not focused, then hide the list
// $('#myInput').focusout($('ul').style.display = "none");
// $(function enter() {
//   setInterval(() => { document.getElementById("myInput").submit() },2000)
  
//   // if (document.activeElement.id !== "myInput") {
//   //   console.log("focus")
//   //   document.getElementsByTagName("ul")['ui-id-1'].style.display = "none";
//   // }
// })

// setTimeout(function() {
//   $('#myInput').trigger('enter');
// }, 2000);

function check() {
  $('#myInput').tooltip()
  // var input = document.getElementById('myInput');
  var ul = document.getElementsByTagName("ul")
  console.log(ul[0])
  if (ul['ui-id-1'].style.display === "none") {
    //set attr title 
    $('#myInput').attr('title', 'Type in a name');
    // console.log('show')
    
    
  } else {
    $('#myInput').removeAttr('title');
  console.log('remove att')}
}



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

// Debounce attempt
// $('#myInput').keyup(debounce(filterFunction()), 3000);
// debouncedFn = $.debounce(filterFunction(), 3000);

// Jeff's JS code

var end_time = new Date();
var start_time = new Date();
var last_time = new Date();


function check_timer() {
  start_time = new Date().getTime();
  // clearInterval(timer)
  let diff = start_time - end_time
  console.log("diff")
  console.log(diff)
  if (diff > 3000) {
  filterFunction()
  console.log('dont repeat')
  end_time = new Date();
  
  }else if (start_time - last_time > 2000) {
      filterFunction();
      console.log('send in the last');
      last_time = new Date();}
  

  // clearInterval(timer)

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
    console.log('add on')
    li = document.createElement("li");
    li.innerText = "------Do you mean-------";
    ul['ui-id-1'].appendChild(li);
    // populate ml result
    for (i = 0; i < 5; i++) {    
      let index = id[i];
        $("<li></li>")
            .data("ui-autocomplete-item", services[i])
            .append("<a href='services/" + String(index+2) + "/time_estimate'>" + services[i] + "</a>")
            .appendTo(ul);
      }
    } else { // if the list is not visible, show it
      console.log("no auto complete")
      while (ul['ui-id-1'].firstChild) {
        ul['ui-id-1'].removeChild(ul['ui-id-1'].firstChild);
    }
    while (ul[0].firstChild) {
      ul[0].removeChild(ul[0].firstChild);
    }
    li = document.createElement("li");
    li.innerText = "------Do you mean-------";
    ul['ui-id-1'].appendChild(li);
    for (i = 0; i < 5; i++) {
      let index = id[i];
      $("<li></li>")
          .data("ui-autocomplete-item", services[i])
          .append("<a href='services/" + String(index+2) + "/time_estimate'>" + services[i] + "</a>")
          .appendTo(ul);
      // li = document.createElement("li");
      // li.innerText = services[i];
      //     // li.innerHTML += "<a href='services/" + String(id[i]+2) + "/time_estimate'>" + "</a>"; // attempt at making the ML suggestions clickable
      // ul['ui-id-1'].appendChild(li);
    }
    if (ul['ui-id-1'].childElementCount > 0) {
    ul['ui-id-1'].style.display = "block";}
    console.log(ul[0])


    

  }
  

 
  
    // if (myUl.firstChild){
    //   //set style
    //   myUl.style.display = "block";
    //   // div.style.display = "block";
    // } else{
    //   // div.style.display = "none";
    // }
    // console.log(myUl)
    
}


function query(inp) {
// implement getrequest
  
      return fetch('http://127.0.0.1:5000/predict?query=' + inp)
          .then(response => response.json());
  
}

