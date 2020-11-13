import 'package:flutter/material.dart';

class CounterView1 extends StatefulWidget {
  final int initNumber;
  final Function(int) counterCallback;
  final Function increaseCallback;

  final Function decreaseCallback;
  CounterView1(
      {this.initNumber,
      this.counterCallback,
      this.increaseCallback,
      this.decreaseCallback});
  @override
  _CounterViewState createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView1> {
  int _currentCount = 0;
  int _currentCountDinn = 0;
  int _currentCountBrake = 0;
  int couponsavail = 24;

  Function _counterCallback;
  Function _increaseCallback;
  Function _decreaseCallback;

  @override
  void initState() {
    // _currentCount = widget.initNumber ?? 1;
    //_currentCountDinn = widget.initNumber ?? 1;
    //_currentCountBrake = widget.initNumber ?? 1;
    _counterCallback = widget.counterCallback ?? (int number) {};
    _increaseCallback = widget.increaseCallback ?? () {};
    _decreaseCallback = widget.decreaseCallback ?? () {};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Avialable coupon  :" + couponsavail.toString(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("lunch Copoun")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createIncrementDicrementButton(
                    Icons.remove, () => _dicrement()),
                Text(_currentCount.toString()),
                _createIncrementDicrementButton(Icons.add, () => _increment()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Diner Coupon")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createIncrementDicrementButton(
                    Icons.remove, () => _dicrementDin()),
                Text(_currentCountDinn.toString()),
                _createIncrementDicrementButton(
                    Icons.add, () => _incrementDin()),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Brakefast Copoun")],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _createIncrementDicrementButton(
                    Icons.remove, () => _dicrementBra()),
                Text(_currentCountBrake.toString()),
                _createIncrementDicrementButton(
                    Icons.add, () => _incrementBra()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _increment() {
    setState(() {
      _currentCount++;
      couponsavail--;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _dicrement() {
    setState(() {
      if (_currentCount > 0) {
        _currentCount--;
        couponsavail++;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  void _incrementDin() {
    setState(() {
      _currentCountDinn++;
      couponsavail--;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _dicrementDin() {
    setState(() {
      if (_currentCountDinn > 0) {
        _currentCountDinn--;
        couponsavail++;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }

  void _incrementBra() {
    setState(() {
      _currentCountBrake++;
      couponsavail--;
      _counterCallback(_currentCount);
      _increaseCallback();
    });
  }

  void _dicrementBra() {
    setState(() {
      if (_currentCount > 0) {
        _currentCountBrake--;
        couponsavail++;
        _counterCallback(_currentCount);
        _decreaseCallback();
      }
    });
  }
  //void coupon() {
  //setState(() {});
  //}

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
