
var process = function() {
  var number = 20151125;
  var key = [1,1];

  while ( key[0] != 3029 | key[1] != 2947 ) {
    key = nextCoord(key);
    number = calc(number);
  }

  console.log(key, number);

};

var nextCoord = function(array) {
  if (array[1] === 1) {
    console.log(array[0]);
    return [1, array[0] + 1];
  }
  else {
    return [array[0] + 1, array[1] - 1];
  }
};

var calc = function(number) {
  return (number * 252533) % 33554393;
};


process();