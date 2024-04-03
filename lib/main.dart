import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    title: 'MD5 Calculator',
    home: MD5Calculator(),
  ));
}

class MD5Calculator extends StatefulWidget {
  @override
  _MD5CalculatorState createState() => _MD5CalculatorState();
}

class _MD5CalculatorState extends State<MD5Calculator> {
  String _inputText = '';
  String _md5Result = '';

  void _calculateMD5() {
    if (_inputText.isNotEmpty) {
      List<int> bytes = utf8.encode(_inputText);
      Digest md5Result = md5.convert(bytes);
      setState(() {
        _md5Result = md5Result.toString();
      });
    } else {
      setState(() {
        _md5Result = 'Please enter a string!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MD5 Calculator'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('image.jpeg'), // Change to your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Enter a string below to calculate its MD5 hash:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 48, 16, 211),
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                onChanged: (value) {
                  setState(() {
                    _inputText = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Enter string',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _calculateMD5,
                child: Text('Calculate MD5'),
              ),
              SizedBox(height: 20.0),
              Text(
                'MD5 Result:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white.withOpacity(0.5),
                ),
                child: Text(
                  _md5Result,
                  style: TextStyle(
                    fontFamily: 'Courier',
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
