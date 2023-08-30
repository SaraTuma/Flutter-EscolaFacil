import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  late TextEditingController _emailController;
  late TextEditingController _senhaController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 200,
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Voltar',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(40, 168, 247, 1),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      Container(
                        width: 200,
                        alignment: Alignment.topLeft,
                        child: Text(
                          'No perfil',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(25, 95, 224, 1),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) {},
                        decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Digite o e-mail',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Erro: E-Mail invalido!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: _senhaController,
                        decoration: InputDecoration(
                            labelText: 'Digite a senha',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Erro: Senha invalida';
                          }
                          return null;
                        },
                      ),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 100, top: 10, bottom: 5),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/redSenha');
                            },
                            child: Text(
                              'Esqueceu a senha?',
                              style: const TextStyle(
                                  color: Color.fromRGBO(25, 95, 224, 1),
                                  letterSpacing: 2.0,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Container(
                        padding: const EdgeInsets.only(top: 5, bottom: 5),
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) =>
                                      const Color.fromRGBO(25, 200, 224, 1))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final email = _emailController.text;
                              final senha = _senhaController.text;
                              print(email);
                              print(senha);
                              Navigator.of(context).pushNamed('/principal');
                            }
                          },
                          child: Text(
                            "Entrar",
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Não tem uma conta?',
                            style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(25, 200, 224, 1)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/addUsuario');
                            },
                            child: Text(
                              'Cria uma conta.',
                              style: const TextStyle(
                                  color: Color.fromRGBO(25, 95, 224, 1),
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )
                    ])),
          )),
    ));
  }
}
