function openCity(evt, cityName) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("city");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablink");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(cityName).style.display = "block";
  evt.currentTarget.className += " active";
}

function validform() {
  // Add your form validation logic here
  return true; // Return false if the form is not valid
}

// Add event listeners to tab buttons
var tablinks = document.getElementsByClassName("tablink");
for (var i = 0; i < tablinks.length; i++) {
  tablinks[i].addEventListener("click", function (event) {
    openCity(event, this.getAttribute("data-city"));
  });
}
