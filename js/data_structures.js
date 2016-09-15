var colors = ["blue", "yellow", "red", "aquapurple"];
var names = ["Jon", "Ed", "Nancy", "Black Beauty"];
names.push("secretariat");
colors.push("eggshell white");
console.log(names);
console.log(colors);

var horsey = {
	name: names[0],
	color: colors[2],
};

console.log(horsey.color);
console.log(horsey.name);

stable = {};
for (var i = 0; i < names.length; i++) {
	stable[names[i]] = colors[i];
};
console.log(stable);

