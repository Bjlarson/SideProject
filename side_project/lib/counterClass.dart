import 'dart:core';


class Counter{
 int count;
    Counter(){
      this.count = 0;
    }

    int increaseCounter(Counter counter){
        counter.count++;
    }
}
