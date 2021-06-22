import 'package:flutter/material.dart';
import 'memory.dart';

class Calculator extends StatefulWidget {
  @override
  createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _memory = Memory();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: <Widget>[
          _buildDisplay(),
          const Divider(height: 0.1),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                _memory.result,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: const TextStyle(
                  fontWeight: FontWeight.w200,
                  decoration: TextDecoration.none,
                  fontSize: 80.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeyboardButton(
    String label, {
    int flex = 1,
    Color textColor = Colors.white,
    Color backgroundColor = Colors.black,
  }) {
    return Expanded(
      flex: flex,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _memory.applyCommand(label);
          });
        },
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 24.0,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
            (states) => backgroundColor,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    return Container(
      color: Colors.black,
      height: 400.0,
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('AC', textColor: Colors.deepOrange),
                _buildKeyboardButton('DEL', textColor: Colors.deepOrange),
                _buildKeyboardButton('%', textColor: Colors.deepOrange),
                _buildKeyboardButton('÷', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('7'),
                _buildKeyboardButton('8'),
                _buildKeyboardButton('9'),
                _buildKeyboardButton('x', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('4'),
                _buildKeyboardButton('5'),
                _buildKeyboardButton('6'),
                _buildKeyboardButton('+', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('1'),
                _buildKeyboardButton('2'),
                _buildKeyboardButton('3'),
                _buildKeyboardButton('-', textColor: Colors.deepOrange),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildKeyboardButton('0', flex: 2),
                _buildKeyboardButton('.'),
                _buildKeyboardButton('=', textColor: Colors.deepOrange),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
