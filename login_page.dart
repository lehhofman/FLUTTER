import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'e-mail'
                  ),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if(email == null || email.isEmpty){
                      return 'Digite seu e-mail';
                    }else if(
                      !RegExp(r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-z]+')
                      .hasMatch(_emailController.text)){
                        return 'Digite um e-mail valido';
                      }
                      return null;
                  },
                ),
                TextFormField(
                    decoration: InputDecoration(
                    labelText: 'senha'
                  ),
                  controller: _passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (senha){
                    if(senha == null || senha.isEmpty){
                      return 'Digite sua senha';
                    }else if(senha.length < 6 ){
                      return 'Digite uma senha com mais de 6 caracteres';
                    }
                    return null;
                  },
                ),
                ElevatedButton(onPressed: (){}, child: Text('ENTRAR'),),
              ]
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> login() async {
  SharedPreferences sharedPreference = await  SharedPreferences.getInstance();
  var url = Uri.parse('https://minhasapi.com.br/login/');
  var resposta = await http.post(url,
  body: {
    'username':_emailController.text,
    'password':_passwordController.text
  },
  );
  if(resposta.statusCode == 200){
    print(jsonDecode(resposta.body)['token']);
    return true;
  }else{
    print(jsonDecode(resposta.body));
    return false;
    }
  }
  }
}