import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../helpers/validators.dart';
import '../models/user_model.dart';
import '../repository/user_repository.dart';

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

  UserModel user = UserModel(email: '', name: '', password: '', type: '');
  late bool loading;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _senhaController = TextEditingController();
    _nomeController = TextEditingController();
    _repSenhaController = TextEditingController();
    loading = true;
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
                child: SingleChildScrollView(
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
                            'Uma conta',
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
                          enabled: loading,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (text) {},
                          onSaved: (name) => user.name = name!,
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              labelText: 'Digite o Nome completo',
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório';
                            } else if (value.trim().split(' ').length <= 1) {
                              return 'Preencha seu Nome Completo';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _emailController,
                          enabled: loading,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (text) {},
                          onSaved: (email) => user.email = email!,
                          decoration: const InputDecoration(
                              alignLabelWithHint: true,
                              labelText: 'Digite o E-mail',
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (!emailValid(value!)) {
                              return 'E-mail inválido!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          enabled: loading,
                          onSaved: (password) => user.password = password!,
                          controller: _senhaController,
                          decoration: InputDecoration(
                              labelText: 'Digite a senha',
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Campo obrigatório';
                            } else if (value.length < 3) {
                              return 'Senha muito curta';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          enabled: loading,
                          controller: _repSenhaController,
                          decoration: InputDecoration(
                              labelText: 'Digite novamente a senha',
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Senha invalida';
                            } else if (value.length < 3) {
                              return 'Senha muito curta';
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
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState?.save();

                                if (user.password != _repSenhaController.text) {
                                  return;
                                }
                                
                                user.type = 'cliente';
                                await context
                                    .read<UserRepository>()
                                    .createNewUser(
                                        user: user,
                                        onFail: (e) {
                                          //mostrar uma SnackBar
                                          debugPrint(e);
                                        },
                                        onSucess: () {
                                          setState(() {
                                            loading = false;
                                          });
                                          debugPrint('Criado com Sucesso!');
                                          Navigator.of(context).pop();
                                        });
                              }
                            },
                            child: !loading
                                ? const CircularProgressIndicator(
                                    valueColor:
                                        AlwaysStoppedAnimation(Colors.white),
                                  )
                                : const Text(
                                    "Criar uma conta",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20.0),
                                  ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Já tem uma conta?',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(25, 200, 224, 1)),
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
                      ]),
                )),
          )),
    ));
  }
}
