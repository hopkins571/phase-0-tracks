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

function Car(make,model,year,color,condition,features) {
	this.make = make;
	this.model = model;
	this.year = year;
	this.color = color;
	this.condition = condition;
	this.features = features;
	this.describe = function() { 
		console.log("I am a " + this.condition + " " + this.color + " " + this.year + " " + this.make + " " + this.model + "!");
		console.log("My features are: " + this.features.toString(', '));
		console.log("Vroom vroom!")};
};
var barry = new Car("Toyota","Prius","2013","aquapurple","used",["A/C","stereo","cruise control"]);
barry.describe();
var sandy = new Car("Suzuki","Baleno","1999","red","used and abused",["anti-theft system","heated seats"]);
sandy.describe();
var lemon = new Car("Fiat","500","2016","green","new",["barely passed safety inspection"]);
lemon.describe();