function check(){
  var input = document.getElementById("myInput");
  var popup = document.getElementById("displayText");
  let ul= document.getElementsByTagName('ul')
 
  if (ul[0].style.display ==='none' && input.value.length > 0 && document.activeElement === input) {
    // popup.style.visibility = "visible";
    filterFunction();

  } else{
    popup.style.visibility = "hidden";
    if(document.activeElement !== input){
      while(ul['ui-id-1'].numChildren > 1){
        ul['ui-id-1'].removeChild(ul['ui-id-1'].firstChild);
      }
    }
  }
}


$(document).on("keypress", "input", function(e){
  if(e.which == 13){
      console.log("Enter")
      go()
    }
  })
setInterval(check,2000)
$(function () {
  //Uses services_sb defined in index.html script tag
  
  // JQuery's autocomplete function
  $("#myInput").autocomplete({
      source: services_sb,
      autofocus: true
  }).data("ui-autocomplete")._renderItem = function( ul, item ) {
      let txt = String(item.value).replace(new RegExp(this.term, "gi"), "<b>$&</b>");
      //find index of service in services array
      let index = services_sb.indexOf(item.value);
      // console.log(index);

      return $("<li></li>")
          .data("ui-autocomplete-item", item)
          .append("<a id='" + item.value + "' href='services/" + String(index+2) + "/time_estimate'>" + txt + "</a>")
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
  for (var i = 0; i < services_sb.length; i++) {
    if (services_sb[i] == value) {
      console.log(services_sb[i])
      let index = services_sb.indexOf(input.value);
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
  console.log(searchDict)
  id = searchDict["top_5_index"];
  services = searchDict['top_5_services'];
  let n = id.length
  console.log(n)
  if (n == 0) {
    console.log(1000)
    while (ul['ui-id-1'].firstChild) {
      ul['ui-id-1'].removeChild(ul['ui-id-1'].firstChild);
  }
  while (ul[0].firstChild) {
    ul[0].removeChild(ul[0].firstChild);
  }
  let li = document.createElement("li");

  li.innerText = "No results found, please try another search.";
  
  li.style = "text-align: center;"; // center text
  li.style.fontWeight = "bold"; //set inner text as bold
  //set inner text as italic 
  li.style.fontStyle = "italic";
  ul['ui-id-1'].appendChild(li);
  console.log(li)
  let divResult = document.getElementById('results')
  console.log(divResult);
  divResult.appendChild(ul['ui-id-1'])
  ul['ui-id-1'].style.position = "absolute";
  ul['ui-id-1'].style.display = "block";
    
  }else{
  
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

      // ul['ui-id-1'].appendChild(hr);
      li.innerText = "Services you may like";
      
      li.style = "text-align: center;"; // center text
      li.style.fontWeight = "bold"; //set inner text as bold
      li.style.fontStyle = "italic";//set inner text as italic 
      ul['ui-id-1'].appendChild(li);

      let divResult = document.getElementById('results')
      console.log(divResult);
      divResult.appendChild(ul['ui-id-1'])
      ul['ui-id-1'].style.position = "absolute";
      
      
      console.log( ul)
      for (i = 0; i < n; i++) {
        let index = id[i];
        $('<li class="ui-menu-item" id="ui-id-6" tabindex="-1"></li>')
            .data("ui-autocomplete-item", services[i])
            .append("<a id='" + services[i] + "' href='services/" + String(index+2) + "/time_estimate'>" + services[i] + "</a>")
            .appendTo(ul['ui-id-1']);
      }
    }
      // if (ul['ui-id-1'].childElementCount > 0 ) {
    ul['ui-id-1'].style.display = "block";
  }
  
}


function query(inp) {
// implement getrequest
  return fetch('http://127.0.0.1:5000/predict?query=' + inp)
      .then(response => response.json());
}

