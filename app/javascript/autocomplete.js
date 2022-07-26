
function debounce(func, wait) {
    let timeout;
    console.log(wait)
    console.log(func)
  
    return () => {
      const later = () => {
        // clearTimeout(timeout);
        func;
      };
  
    //   clearTimeout(timeout);
      console.log(later)
      timeout = setTimeout(later, wait);
    };
  };

// const debounce = (func, delay) => { 

//     let debounceTimer 

//     return function() { 

//         const context = this

//         const args = arguments 

//             clearTimeout(debounceTimer) 

//                 debounceTimer  = setTimeout(() => func.apply(context, args), delay) 

//     } 
// }  


function test() {
    let op = console.log("test")
}


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
    div = document.getElementById("results");
    ul = document.getElementsByTagName("ul");  // where is the element with tagname "ul"?
   
    searchDict = await query(input.value);
    // console.log("S:" + searchDict);
    li = document.createElement("li");
    li.innerText = "------Do you mean-------";
    
    ul[0].appendChild(li);

    id = searchDict["top_5_index"];
    services = searchDict['top_5_services'];
    

  // console.log(services);
    await new Promise(resolve => setTimeout(resolve, 1000));
    for (i = 0; i < 5; i++) {
            
        li = document.createElement("li");
        console.log(li.element.childElementCount)
        li.innerText = services[i];
            // li.innerHTML += "<a href='services/" + String(id[i]+2) + "/time_estimate'>" + "</a>"; // attempt at making the ML suggestions clickable
            
            ul[0].appendChild(li);
        }
}

// right now the behaviour is such that we need to type really fast in order for the AI results to appear nicely (1 time without repeating)

// set a timeout 
var timeout = 0
function query(inp) {
  // implement getrequest
    
        return fetch('http://127.0.0.1:5000/predict?query=' + inp)
            .then(response => response.json());
    
}

