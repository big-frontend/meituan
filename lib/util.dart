import 'dart:math';

bool isEmpty(String s) {
  return s == null || s.length == 0;
}

List shuffle(List items) {
  var random = new Random();
  for (var i = items.length - 1; i > 0; i--) {
    var n = random.nextInt(i + 1);
    var temp = items[i];
    items[i] = items[n];
    items[n] = temp;
  }
  return items;
}

var r = Random();
int gen() {
  return r.nextInt(10);
}
