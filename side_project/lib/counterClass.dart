import 'dart:core';

class Counter {
  int count;
  DateTime lastUpdateTime;
  String counterName;

  //default
  Counter() {
    this.count = 0;
    this.lastUpdateTime = DateTime.now();
    this.counterName = "";
  }

//with name
Counter.counterWithName(String name){
  this.count = 0;
    this.lastUpdateTime = DateTime.now();
    this.counterName = name;
}

  int increaseCounter(Counter counter) {
    counter.count++;
    counter.lastUpdateTime = DateTime.now();
  }

  void counterReset(Counter counter) {
    var counterUpdate = DateTime.now()
        .difference(counter.lastUpdateTime);

    if (counterUpdate.inHours > 36) {
      counter.count = 0;
      counter.lastUpdateTime = DateTime.now();
    }
  }
}
