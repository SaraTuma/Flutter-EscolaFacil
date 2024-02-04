import 'package:flutter/material.dart';
import 'package:flutter_escola_facil/repository/user_repository.dart';
import 'package:flutter_escola_facil/screens/tela_cadastro.dart';
import 'package:flutter_escola_facil/screens/tela_carrinho.dart';
import 'package:flutter_escola_facil/screens/tela_detalhes_produto.dart';
import 'package:flutter_escola_facil/screens/tela_encomendas.dart';
import 'package:flutter_escola_facil/screens/tela_inicial.dart';
import 'package:flutter_escola_facil/screens/tela_login.dart';
import 'package:flutter_escola_facil/screens/tela_principal.dart';
import 'package:flutter_escola_facil/screens/tela_redefinir_senha.dart';
import 'package:flutter_escola_facil/screens/tela_splash.dart';
import 'package:provider/provider.dart';

import 'authentication/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => UserRepository(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loja de Materiais',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(elevation: 0),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        
        initialRoute: '/',
        routes: {
          '/': (context) => const TelaSplash(),
          //'/': (context) => const LoginScreen(),
          '/inicial': (context) => const TelaInicial(),
          '/login': (context) => const TelaLogin(),
          '/principal': (context) => const TelaPrincipal(),
          '/produto': (context) => const TelaDetalhesProduto(),
          '/addUsuario': (context) => const TelaAdicionarUsuario(),
          '/redSenha': (context) => const TelaRedefinirSenha(),
          '/carrinho': (context) => const TelaCarrinho(),
          '/encomendas': (context) => const TelaEncomendas(),
        },
      ),
    );
  }
}
