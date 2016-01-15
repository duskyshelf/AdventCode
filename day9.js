var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
  terminal: false
});

var data = {};
var locations = [];

rl.on('line', function(line) {
  var splitLine = line.split(" = ");
  var locs = splitLine[0].split(" ");

  data[ [locs[0], locs[2]] ] = splitLine[1];
  data[ [locs[2], locs[0]] ] = splitLine[1];

  if ( locations.indexOf(locs[0]) == -1 ) {
    locations.push(locs[0]);
  }

  if ( locations.indexOf(locs[2]) == -1 ) {
    locations.push(locs[2]);
  }

}).on('close', function() {

  var distances = [];
  var routes = permutator(locations);
  var num = locations.length - 1;

  routes.forEach(function(elem) {
    var distance = 0;

    for (var i = 0; i < num; i++) {
      distance += parseInt(data[(elem[i] + "," + elem[(i + 1)])]);
    }

    distances.push(distance);
  });

  console.log( Math.max.apply(Math, distances) );

});

function permutator(inputArr) {
  var results = [];

  function permute(arr, memo) {
    var cur, memo = memo || [];

    for (var i = 0; i < arr.length; i++) {
      cur = arr.splice(i, 1);
      if (arr.length === 0) {
        results.push(memo.concat(cur));
      }
      permute(arr.slice(), memo.concat(cur));
      arr.splice(i, 0, cur[0]);
    }

    return results;
  }

  return permute(inputArr);
}