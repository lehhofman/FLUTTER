import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // Inicia a aplicação Flutter.
}

class MyApp extends StatelessWidget { // Classe que representa a aplicação como um todo.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { // Constrói a estrutura geral da aplicação.
    return MaterialApp(
      home: LoginPage(), // Define a página inicial como a LoginPage.
    );
  }
}

class LoginPage extends StatefulWidget { // Página de login, classe StatefulWidget para lidar com o estado.
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState(); // Cria o estado da página de login.
}

class _LoginPageState extends State<LoginPage> { // Estado da página de login.
  final _formKey = GlobalKey<FormState>(); // Chave global para o formulário.
  final _emailController = TextEditingController(); // Controller para o campo de e-mail.
  final _senhaController = TextEditingController(); // Controller para o campo de senha.

  @override
  Widget build(BuildContext context) { // Constrói a interface da página de login.
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey, // Associa a chave global ao formulário.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 20),
                TextFormField( // Campo de entrada para e-mail.
                  controller: _emailController, // Associa o controller ao campo.
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    hintText: 'nome@gmail.com',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  validator: (email) { // Validação do campo de e-mail.
                    if (email == null || email.isEmpty) {
                      return 'Digite seu email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField( // Campo de entrada para senha.
                  controller: _senhaController, // Associa o controller ao campo.
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  textAlign: TextAlign.center,
                  validator: (senha) { // Validação do campo de senha.
                    if (senha == null || senha.isEmpty) {
                      return 'Digite sua senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton( // Botão de login.
                  onPressed: () {
                    if (_formKey.currentState!.validate()) { // Valida o formulário.
                      logar(context); // Chama a função para realizar o login.
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

  void logar(BuildContext context) { // Função para realizar o login.
    String email = _emailController.text; // Obtém o valor do campo de e-mail.
    String senha = _senhaController.text; // Obtém o valor do campo de senha.

    if (email == 'usuario@gmail.com' && senha == 'senha123') { // Verifica as credenciais.
      print('Login bem-sucedido!'); // Mensagem de login bem-sucedido.
      Navigator.pushReplacement( // Navega para a HomePage.
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      print('Credenciais inválidas!'); // Mensagem de credenciais inválidas.
      showDialog( // Exibe um AlertDialog para informar ao usuário sobre o erro de login.
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

class HomePage extends StatefulWidget { // Página inicial da aplicação.
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { // Estado da página inicial.
  int count = 0; // Variável para o contador.

  void decrement() { // Função para decrementar o contador.
    setState(() {
      count--;
      _showMessages("Que Pena :("); // Exibe uma mensagem quando o contador é decrementado.
    });
  }

  void increment() { // Função para incrementar o contador.
    setState(() {
      count++;
      _showMessage("Bem Vindo :)"); // Exibe uma mensagem quando o contador é incrementado.
    });
  }

  void _showMessage(String message) { // Exibe uma mensagem na parte inferior da tela.
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

  void _showMessages(String message) { // Exibe uma mensagem na parte inferior da tela.
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
  Widget build(BuildContext context) { // Constrói a interface da página inicial.
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
                onPressed: decrement, // Função chamada ao pressionar o botão 'Sair'.
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
                onPressed: increment, // Função chamada ao pressionar o botão 'Entrar'.
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
