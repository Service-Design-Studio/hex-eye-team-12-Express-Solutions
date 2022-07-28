


function go(){
  console.log("go")
  let input = document.getElementById("myInput");
  let ul = document.getElementsByTagName("ul")
  //redirect to link 

  //if input.value in services array 
  value = input.value
  console.log("value: " + value)

  // loop through services and check if value is in services array
  for (var i = 0; i < services_sb.length; i++) {
    if (services_sb[i] == value) {
      console.log(services_sb[i])
      let index = services_sb.indexOf(input.value);
      window.location.href = "http://127.0.0.1:3000/services/"+ String(index+2)+"/time_estimate"
    }
  }
}


//condition to show AI recommended services
function check(){
  let input = document.getElementById("myInput");
  let ul= document.getElementsByTagName('ul')
  let div= document.getElementById('results')

  if(document.activeElement !== input){
    console.log('input is not focused')

    for (var i = 0; i < ul.length; i++) {
      //remove all li elements from ul
      while (ul[i].firstChild) {
        ul[i].removeChild(ul[i].firstChild);
    }
    console.log(ul)
  }
    //remove ul 

    

    while(div.numChildren > 1){
      console.log('removing child')
      div.removeChild(div.firstChild);
    }
  }
 
  if (ul[0].style.display ==='none' && input.value.length > 0 && document.activeElement === input) {
    console.log('processing AI recommendation')
    filterFunction();
  } 
}

// check if condition is met for AI recommendation at intervals
setInterval(check,2000)



// JQuery's autocomplete function
$(function () {
  $("#myInput").autocomplete({
      source: services_sb,
      autofocus: true
  }).data("ui-autocomplete")._renderItem = function( ul, item ) {
      let txt = String(item.value).replace(new RegExp(this.term, "gi"), "<b>$&</b>");
      //find index of service in services array
      let index = services_sb.indexOf(item.value);
      return $("<li></li>")
          .data("ui-autocomplete-item", item)
          .append("<a id='" + item.value + "' href='services/" + String(index+2) + "/time_estimate'>" + txt + "</a>")
          .appendTo(ul);
      };
});



async function filterFunction() {
 
  let input, ul, n, li,divResult
  input = document.getElementById("myInput");
  ul = document.getElementsByTagName("ul")
  searchDict = await query(input.value); // get search results from API
  id = searchDict["top_5_index"];
  services = searchDict['top_5_services'];
  divResult = document.getElementById('results')

  n = id.length

  // remove previous recommendations
  while (ul['ui-id-1'].firstChild) {
    console.log('removing child')
    ul['ui-id-1'].removeChild(ul['ui-id-1'].firstChild);
  }
  while (ul[0].firstChild) {
    console.log('removing child')
    ul[0].removeChild(ul[0].firstChild);
  }

  if (n == 0) {
    console.log("no services recommended")
    
    // Tell user no recommended services
    li = document.createElement("li");
    li.innerText = "No results found, please try another search.";
    li.style = "text-align: center;"; 
    li.style.fontWeight = "bold"; 
    li.style.fontStyle = "italic";
    ul['ui-id-1'].appendChild(li);
    console.log(li)

    
    console.log(divResult);
    divResult.appendChild(ul['ui-id-1'])  
  

  } else { 
    console.log("show AI recommended services")

    li = document.createElement("li");
    li.innerText = "Services you may like";
    li.style = "text-align: center;"; // center text
    li.style.fontWeight = "bold"; //set inner text as bold
    li.style.fontStyle = "italic";//set inner text as italic 
    ul['ui-id-1'].appendChild(li);

    
    console.log(divResult);
    divResult.appendChild(ul['ui-id-1'])
    
    // create list of recommended services
    for (i = 0; i < n; i++) {
      let index = id[i];
      $('<li class="ui-menu-item" id="ui-id-6" tabindex="-1"></li>')
          .data("ui-autocomplete-item", services[i])
          .append("<a id='" + services[i] + "' href='services/" + String(index+2) + "/time_estimate'>" + services[i] + "</a>")
          .appendTo(ul['ui-id-1']);
    }  
  }
  // show list of recommended services properly
  ul['ui-id-1'].style.position = "absolute";
  ul['ui-id-1'].style.display = "block";
  divResult.style= {'min-width': '100%'};
  ul['ui-id-1'].style = {'min-width': '100%'};   
}


// function to get services from API
function query(inp) {
// implement getrequest
  return fetch('http://127.0.0.1:5000/predict?query=' + inp)
      .then(response => response.json());
}



// if user press enter, try to go to the service page if it exists
$(document).on("keypress", "input", function(e){
  if(e.which == 13){
      console.log("Enter")
      go() //go to service page "if it exists" function
    }
  })
