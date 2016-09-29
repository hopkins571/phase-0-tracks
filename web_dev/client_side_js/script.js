var header = document.getElementsByTagName("h1")[0];

header.style.color = "red";



function Gold_background(event){
	var body = document.getElementsByTagName("body")[0];
	body.style.background = "gold";
	event.target.style.border = "3px dotted red";
}

var photo = document.getElementById("kitten");
photo.addEventListener("click", Gold_background);