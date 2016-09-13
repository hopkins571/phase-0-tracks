// create new function that accepts one string - variable text
// create new variable newstring - blank string
// create for loop - conditions:
// define variable i = length of text minus one
// run loop while i is >= 0
// i is decreasing by 1 each iteration
// loop behavior: add the character of text at index i to newstring
// function returns newstring

function reverse(text) {
	var newstring = "";
	for (var i = (text.length - 1); i >= 0; i--) { newstring += text[i] };
	return newstring
};
console.log(reverse("jello!"));
var reversed_str = reverse("grizzly bear!");
if (reversed_str == "!raeb ylzzirg") {
	console.log(reversed_str);
}