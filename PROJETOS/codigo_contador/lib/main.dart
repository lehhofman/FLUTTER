import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count--;
      _showMessages("Que Pena :(");
    });
  }

  void increment() {
    setState(() {
      count++;
      _showMessage("Bem Vindo :)");
    });
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.lightGreenAccent,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }

  void _showMessages(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'CONTADOR',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            '$count',
            style: TextStyle(
              fontSize: 100,
              color: Colors.cyan,
            ),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: decrement,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  fixedSize: const Size(100, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'Sair',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              SizedBox(width: 64),
              TextButton(
                onPressed: increment,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.lime,
                  fixedSize: const Size(100, 80),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

