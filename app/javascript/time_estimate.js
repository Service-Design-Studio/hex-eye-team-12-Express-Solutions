
async function changeTime(branch){
    var time_dict = JSON.parse(document.getElementById("data-time-dict").getAttribute('data-time-dict'));
    var service_time = document.getElementById("data-service-time").getAttribute('data-service-time');

    new_time = parseInt(time_dict[branch]) + parseInt(service_time)

    document.getElementById("branchtime").innerHTML = new_time + " min";
}

