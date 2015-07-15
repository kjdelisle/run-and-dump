//Quick stub program for run-and-dump testing

var fs = require('fs');
var fileName = "default.txt";
if (process.argv.length > 2 && process.argv[2] != "")
	fileName = process.argv[2];
fs.watchFile(fileName, function(){
	console.dir("The watched file ( " + fileName + ") has changed!");		
});

console.log("Now watching " + fileName);