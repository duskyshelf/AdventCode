function getSnack (type) {
  function isDrink () {
    return 'Drink';
  }
  function isFood () {
    return 'Food';
  }
  var snacks = {
    'coke': isDrink,
    'pepsi': isDrink,
    'cookies': isFood,
    'crisps': isFood,
  };
  return snacks[type]();
}

var snack = getSnack('coke');
console.log(snack);