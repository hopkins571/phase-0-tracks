// FUNCTION: find the longest phrase
// INPUT PARAMETERS: an array of multiple strings
// OUTPUT: variable longestWord - the string that was the longest of all in the input array
// create new variable longestWord - set it equal to index 0 of the input array
// starting at index 1, iterate through the remaining indices of the array:
// IF the length of the variable longestWord is LESS THAN the length of the current index of the array
// THEN replace the value of longestWord with the current index of the array
// RETURN longestWord

function returnLongest(arrayOfStrings) {
	var longestWord = arrayOfStrings[0];
	for (var i = 1; i <= (arrayOfStrings.length - 1); i++) {
		if (longestWord.length < arrayOfStrings[i].length) {
			 longestWord = arrayOfStrings[i];
		}
	}
	return longestWord;
}

// FUNCTION: compare objects
// INPUT PARAMETERS: two objects - object1 and object2
// OUTPUT: boolean variable hasSharedPair
// define variable hasSharedPair - false
// iterate through each key of object1:
// 	IF the value of the key currently being iterated in object1 is equal to the value of the key of the same name in object2
// 	THEN hasSharedPair is true
// RETURN hasSharedPair


function compareObjs(object1,object2) {
	var hasSharedPair = false;
	for (var key in object1) {
		if (object1[key] == object2[key]) {
			hasSharedPair = true;
		}
	}
	return hasSharedPair;
}

// FUNCTION: array generator
// INPUT PARAMETER: integer
// OUTPUT: array of strings (single words) - number of indices of array must eq input integer
// define a variable randomWords that is an array of random words, varying in length up to 10 letters
// define a varriable arrayOfWords - blank array
// IF input integer > 0, THEN proceed with rest of function - else execute no further code in this function
// loop input integer # of times:
// Push a new value into arrayOfWords: rondomWords (array) at index of (random integer from 0 to length of randomWords - 1)
// RETURN arrayOfWords

function arrayGenerator(numOfWords) {
	var randomWords = ["a", "by", "tan", "tree", "peach", "writes", "munches", "quibbles", "airplanes", "squigglier", "ayatollah", "chowder", "vine", "gizmo", "map", "up", "jazz", "geography", "antiviral"];	var arrayOfWords = [];
	var arrayOfWords = [];
	if (numOfWords > 0) {
		for (var x = 1; x <= numOfWords; x++) {
			arrayOfWords.push(randomWords[Math.floor(Math.random() * randomWords.length)]);
		}
	}
	return arrayOfWords;
}

// DRIVER CODE:

var testArray = ["long", "longest", "etetetetetetettetetetetetetetetetetettetetetete", "etes,th.stphsoennet", "3394949494933"];
var anotherArray = ["1", "22", "999999999", "666666", "4444", "7777777", "55555", "333", "88888888"];

console.log(returnLongest(testArray));
console.log(returnLongest(anotherArray));

var cat = {name: "Fluffy", age: 8, demeanor: "unfriedly"};
var dog = {name: "Fido", age: 8, demeanor: "friendly"};
var ferret = {name: "Arnold", age: 2, demeanor: "friendly"};
console.log(compareObjs(cat,dog));
console.log(compareObjs(cat,ferret));
console.log(compareObjs(dog,ferret));
console.log(arrayGenerator(6));
for (var n = 0; n < 10; n++) {
	var randomWordArray = arrayGenerator(5);
	console.log("Array number " + (n + 1) + " is: " + randomWordArray);
	var longest = returnLongest(randomWordArray);
	console.log("The longest word in the array is " + longest + ".");
	console.log("");
}