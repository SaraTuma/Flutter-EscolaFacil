import 'package:flutter/material.dart';
import 'package:flutter_escola_facil/helpers/validators.dart';
import 'package:provider/provider.dart';
import '../models/user_model.dart';
import '../repository/user_repository.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  late TextEditingController _emailController;
  late TextEditingController _senhaController;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  late bool loading;

  @override
  void initState() {
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    loading = true;
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
      key: _scaffoldKey,
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
                child: SizedBox(
                  height: 500,
                  child: SingleChildScrollView(
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
                            autocorrect: false,
                            enabled: loading,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (text) {},
                            decoration: const InputDecoration(
                                alignLabelWithHint: true,
                                labelText: 'Digite o e-mail',
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (!emailValid(value!)) {
                                return 'E-mail inválido!';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            obscureText: true,
                            autocorrect: false,
                            enabled: loading,
                            controller: _senhaController,
                            decoration: InputDecoration(
                                labelText: 'Digite a senha',
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Senha inválida';
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
                            padding: const EdgeInsets.only(top: 8, bottom: 8),
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateColor.resolveWith((states) =>
                                          const Color.fromRGBO(
                                              25, 200, 224, 1))),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  UserModel? user = await context
                                      .read<UserRepository>()
                                      .fazerLogin(
                                          password: _senhaController.text,
                                          email: _emailController.text.trim(),
                                          onFail: (e) {
                                            //mostrar uma SnackBar
                                            debugPrint(e);
                                          },
                                          onSucess: () {
                                            debugPrint('Sucesso!');
                                            setState(() {
                                              loading = false;
                                            });
                                            Navigator.of(context)
                                                .pushNamed('/principal');
                                          });

                                  if (user == null) {
                                    debugPrint("ERRO: O Usuario não existe!");
                                  }
                                }
                              },
                              child: !loading
                                  ? CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    )
                                  : const Text(
                                      "Entrar",
                                      style: TextStyle(
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
                                    color:
                                        const Color.fromRGBO(25, 200, 224, 1)),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/addUsuario');
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
                        ]),
                  ),
                )),
          )),
    ));
  }
}
