function lookLoop(num) {

  for (var i = 0; i < 50; i++) {
    num = lookSay(num);
    console.log(i);
  }

  return num;
}

function lookSay(num) {
  var numString = "";
  var numArray = letterCount(num.toString());

  numArray.forEach(function(elem){
    numString += elem[0] + elem[1];
  });

  return numString;
}

function letterCount(str){
  var s = str.match(/(.)\1*/g)||[];
  return s.map(function(itm){
    return [itm.length.toString(), itm.charAt(0)];
  });
}

console.log(lookLoop(3113322113).length);

