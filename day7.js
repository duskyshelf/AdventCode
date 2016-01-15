var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

var data = {};

var loopnum = 0;

rl.on('line', function(line) {
  var splitLine = line.split(" -> ");
  data[splitLine[1]] = strFnTranslate(splitLine[0].split(" "));
}).on('close', function() {
  while (!isSolved(data.a)) {
    Object.keys(data).forEach(function(key) {
      data[key].forEach(function(elem, index){
        if (data[elem] && isSolved(data[elem])) {
          data[key][index] = parseInt(data[elem][0]);
        } 
      });
    });
    Object.keys(data).forEach(function(key) {
      if (isNumeric(data[key][0]) && data[key][1] == "LSHIFT") {
        data[key] = lshift(data[key]);
      }
      if (isNumeric(data[key][0]) && data[key][1] == "RSHIFT") {
        data[key] = rshift(data[key]);
      }
      if (isNumeric(data[key][1]) && data[key][0] == "NOT") {
        data[key] = not(data[key]);
      }
      if (isNumeric(data[key][0]) && isNumeric(data[key][2]) && data[key][1] == "AND") {
        data[key] = and(data[key]);
      }
      if (isNumeric(data[key][0]) && isNumeric(data[key][2]) && data[key][1] == "OR") {
        data[key] = or(data[key]);
      }
    });
    loopnum += 1;
    console.log(loopnum);
  }
  console.log(data.a);
});

var isNumeric = function(string) {
  return !isNaN(string);
};

var strFnTranslate = function(array) {
  if (array.length == 1 && isNumeric(array[0])) {
    return [ parseInt(array[0]) ];
  }
  return array;
};

var isSolved = function(fn) {
  return (fn.length == 1 && isNumeric(fn[0]));
};

var lshift = function(input) {
  var left = parseInt(input[0]);
  var right = parseInt(input[2]);
  return [ left << right ];
};

var rshift = function(input) {
  var left = parseInt(input[0]);
  var right = parseInt(input[2]);
  return [ left >> right ];
};

var not = function(input) {
  return [ ~ parseInt(input[1]) ];
};

var and = function(input) {
  var left = parseInt(input[0]);
  var right = parseInt(input[2]);
  return [ left & right ];
};

var or = function(input) {
  var left = parseInt(input[0]);
  var right = parseInt(input[2]);
  return [ left | right ];
};


