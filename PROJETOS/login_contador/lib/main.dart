import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'nome@gmail.com',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  validator: (email) {
                    if (email == null || email.isEmpty) {
                      return 'Digite seu email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _senhaController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  validator: (senha) {
                    if (senha == null || senha.isEmpty) {
                      return 'Digite sua senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      logar(context); 
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent,
                    minimumSize: Size(100, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Entrar',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void logar(BuildContext context) {
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (email == 'usuario@gmail.com' && senha == 'senha123') {
      print('Login bem-sucedido!');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      ); 
    } else {
      print('Credenciais inválidas!');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro de login'),
          content: Text('Credenciais inválidas. Por favor, verifique e tente novamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
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
        const SizedBox(height: 80),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => LoginPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.yellow[900],
            minimumSize: Size(200, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Login',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
}
