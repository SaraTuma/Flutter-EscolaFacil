import 'package:flutter/material.dart';

class TelaRedefinirSenha extends StatefulWidget {
  const TelaRedefinirSenha({super.key});

  @override
  State<TelaRedefinirSenha> createState() => _TelaRedefinirSenhaState();
}

class _TelaRedefinirSenhaState extends State<TelaRedefinirSenha> {
  late TextEditingController _repSenhaController;
  late TextEditingController _senhaController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _repSenhaController = TextEditingController();
    _senhaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _repSenhaController.dispose();
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
                          'Redefinir',
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
                          'a sua senha',
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
                        controller: _senhaController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) {},
                        decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Digite a nova senha',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Erro: Senha invalida!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        obscureText: true,
                        controller: _repSenhaController,
                        decoration: InputDecoration(
                            labelText: 'Digite novamente a senha',
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
                              Navigator.of(context).pushNamed('/addUsuario');
                            },
                            child: Text(
                              'Não tem uma conta?',
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
                              final repSenha = _repSenhaController.text;
                              final senha = _senhaController.text;
                              print(repSenha);
                              print(senha);
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
                            'Já tem uma conta?',
                            style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(25, 200, 224, 1)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed('/login');
                            },
                            child: Text(
                              'Entre agora.',
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
