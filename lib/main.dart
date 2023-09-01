import 'package:flutter/material.dart';
import 'package:flutter_escola_facil/view/tela_add_usuario.dart';
import 'package:flutter_escola_facil/view/tela_carrinho.dart';
import 'package:flutter_escola_facil/view/tela_detalhes_produto.dart';
import 'package:flutter_escola_facil/view/tela_inicial.dart';
import 'package:flutter_escola_facil/view/tela_login.dart';
import 'package:flutter_escola_facil/view/tela_principal.dart';
import 'package:flutter_escola_facil/view/tela_redefinir_senha.dart';
import 'package:flutter_escola_facil/view/tela_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaSplash(),
        '/inicial': (context) => const TelaInicial(),
        '/login': (context) => const TelaLogin(),
        '/principal': (context) => const TelaPrincipal(),
        '/produto': (context) => const TelaDetalhesProduto(),
        '/addUsuario': (context) => const TelaAdicionarUsuario(),
        '/redSenha': (context) => const TelaRedefinirSenha(),
        '/carrinho': (context) => const TelaCarrinho(),
      },
    );
  }
}
