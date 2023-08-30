import 'package:flutter/material.dart';

class TelaAdicionarUsuario extends StatefulWidget {
  const TelaAdicionarUsuario({super.key});

  @override
  State<TelaAdicionarUsuario> createState() => _TelaAdicionarUsuarioState();
}

class _TelaAdicionarUsuarioState extends State<TelaAdicionarUsuario> {
  late TextEditingController _emailController;
  late TextEditingController _senhaController;
  late TextEditingController _nomeController; //
  late TextEditingController _repSenhaController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    _nomeController = TextEditingController();
    _repSenhaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    _nomeController.dispose();
    _repSenhaController.dispose();
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
                          'Criar',
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
                          'uma conta',
                          style: TextStyle(
                              fontSize: 30,
                              color: Color.fromRGBO(25, 95, 224, 1),
                              fontWeight: FontWeight.w900),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _nomeController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) {},
                        decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Digite o Nome completo',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Erro: Nome inválido!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (text) {},
                        decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            labelText: 'Digite o E-mail',
                            border: OutlineInputBorder()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Erro: E-Mail invalido!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
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
                      const SizedBox(
                        height: 20,
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
                      const SizedBox(
                        height: 20,
                      ),
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
                            "Criar uma conta",
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
                            onPressed: () {},
                            child: Text(
                              'Entrar agora.',
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
