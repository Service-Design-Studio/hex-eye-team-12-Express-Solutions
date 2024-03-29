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
        try { //for production
          window.location.href = "https://hexeye-subesh-1-pob5qcpita-as.a.run.app"+"/services/"+ String(index+2)+"/time_estimate";
        }
        catch(err) { //for localhost
          console.log(err.message);
          window.location.href = "http://127.0.0.1:3000/services/"+ String(index+2)+"/time_estimate"
        }
      }
    }
  }
  
  
  //condition to show AI recommended services
  function check(){
  
   if (document.URL.endsWith("/services")){
    let input = document.getElementById("myInput");
    let ul= document.getElementsByTagName('ul')
    let div= document.getElementById('results')
    let popout = document.getElementById('popout')
  
    if(document.activeElement !== input){
      console.log('input is not focused')
      popout.style.visibility = "hidden"
  
      for (var i = 0; i < ul.length; i++) {
        //remove all li elements from ul
        while (ul[i].firstChild) {
          ul[i].removeChild(ul[i].firstChild);
        }
        while (ul.firstChild){
          ul.removeChild(ul.firstChild);
        }
     }
     return false
    }
  
    // ui_id_1 = document.getElementById('ui-id-1')
    for (var i = 0; i < services_sb.length; i++) {
      if (services_sb[i] == input.value) {
        console.log('exit')
        popout.style.visibility = "visible"
        return false
      }
    }
  
   
    if (ul[0].style.display ==='none' && input.value.length > 0 && document.activeElement === input) {
      console.log('processing AI recommendation')
      popout.style.visibility = "hidden"
      filterFunction();
    } 
  }
  }
  
  // check if condition is met for AI recommendation at intervals
  setInterval(check,300)
  
  
  
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
              .append("<a class='searchlist' id='" + item.value + "' href='services/" + String(index+2) + "/time_estimate'>" + txt + "</a>")
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
      ul['ui-id-1'].removeChild(ul['ui-id-1'].firstChild);
    }
    while (ul[0].firstChild) {
      ul[0].removeChild(ul[0].firstChild);
    }
  
    if (n == 0) {
      console.log("no services recommended")
      
      // Tell user no recommended services
      li = document.createElement("li");
      li.innerText = "No results found, please try another search.";
      li.classList.add("unselectable");
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
      li.classList.add("unselectable");
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
          .data("ui-autocomplete-item", {"value":services[i]})
          .append("<a class='searchlist' id='" + services[i] + "' href='services/" + String(index+2) + "/time_estimate'>" + services[i] + "</a>")
          .appendTo(ul['ui-id-1']);
      }  
  }
    // show list of recommended services properly
    ul['ui-id-1'].style.position = "absolute";
    ul['ui-id-1'].style.display = "block";
    //fit parent width
    divResult.style.width = "100%";
    ul['ui-id-1'].style.width = "100%";
  }
  
  
  // function to get services from API
  function query(inp) {
  // implement getrequest
    try { //for production
      // return fetch('https://search-ai-ainfo4wkya-uc.a.run.app/predict?query=' + inp) //for production
      return fetch('http://127.0.0.1:5000/predict?query=' + inp) //for localhost
        .then(response => response.json());
    }
    catch(err) { //for localhost
      console.log(err.message);
      return fetch('http://127.0.0.1:5000/predict?query=' + inp)
        .then(response => response.json());
    }
    
  }
  
  
  
  // if user press enter, try to go to the service page if it exists
  $(document).on("keypress", "input", function(e){
    if(e.which == 13){
        console.log("Enter")
        go() //go to service page "if it exists" function
      }
    })