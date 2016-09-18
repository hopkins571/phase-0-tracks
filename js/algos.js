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
	for (i = 1; i <= (arrayOfStrings.length - 1); i++) {
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






var testArray = ["long", "longest", "etetetetetetettetetetetetetetetetetettetetetete", "etes,th.stphsoennet", "3394949494933"];
var anotherArray = ["1", "22", "999999999", "666666", "4444", "7777777", "55555", "333", "88888888"]

console.log(returnLongest(testArray));
console.log(returnLongest(anotherArray))

