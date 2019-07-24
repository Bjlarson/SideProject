import 'package:flutter/material.dart';
import 'package:side_project/counterClass.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streak Counter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Streak Counter'),
    );
  }
}

final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Counter counter = new Counter();

  void _incrementCounter() {
    setState(() {
      counter.increaseCounter(counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _buildList(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add)
      ),
    );
  }

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          return _buildCounterRows(counter);
        });
  }

  Widget _buildCounterRows(Counter counter) {
    return ListTile(
        title: Text(
      counter.counterName,
      style: _biggerFont,
      ),
      trailing: Text(
        counter.count.toString()
      ),
    );
  }
}
