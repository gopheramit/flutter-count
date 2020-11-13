import 'package:flutter/material.dart';
import 'package:count/count.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Welcome to flutter",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Welcome to flutter"),
          ),
          body: Center(child: CounterView1()
              //child: CounterView(),
              ),
        ));
  }
}

class CounterView extends StatefulWidget {
  final int initNumber;
  final Function(int) counterCallback;
  final Function increaseCallback;

  final Function decreaseCallback;
  CounterView(
      {this.initNumber,
      this.counterCallback,
      this.increaseCallback,
      this.decreaseCallback});
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int _currentCount;
  Function _counterCallback;
  Function _increaseCallback;
  Function _decreaseCallback;

  @override
  void initState() {
    _currentCount = widget.initNumber ?? 1;
    _counterCallback = widget.counterCallback ?? (int number) {};
    _increaseCallback = widget.increaseCallback ?? () {};
    _decreaseCallback = widget.decreaseCallback ?? () {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        width: 500.0,
        height: 100.0,
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(BorderRadiusMedium),
          color: Colors.blue,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _createIncrementDicrementButton(
                    Icons.remove, () => _dicrement()),
                Text(_currentCount.toString()),
                _createIncrementDicrementButton(Icons.add, () => _increment()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _createIncrementDicrementButton(
                    Icons.remove, () => _dicrement()),
                Text(_currentCount.toString()),
                _createIncrementDicrementButton(Icons.add, () => _increment()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _createIncrementDicrementButton(
                    Icons.remove, () => _dicrement()),
                Text(_currentCount.toString()),
                _createIncrementDicrementButton(Icons.add, () => _increment()),
              ],
            ),
          ],
        ));
  }

  void _increment() {
    setState(() {
      _currentCount++;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > 1) {
        _currentCount--;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  Widget _createIncrementDicrementButton(IconData icon, Function onPressed) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minWidth: 32.0, minHeight: 32.0),
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: Colors.deepOrangeAccent,
      child: Icon(
        icon,
        color: Colors.black,
        size: 12.0,
      ),
      shape: CircleBorder(),
    );
  }
}
