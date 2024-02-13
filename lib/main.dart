import 'package:flutter/material.dart';
import 'package:flutter_escola_facil/repository/user_repository.dart';
import 'package:flutter_escola_facil/screens/signup_screen.dart';
import 'package:flutter_escola_facil/screens/chart_screen.dart';
import 'package:flutter_escola_facil/screens/detail_product_screen.dart';
import 'package:flutter_escola_facil/screens/encomenda_screen.dart';
import 'package:flutter_escola_facil/screens/initial_screen.dart';
import 'package:flutter_escola_facil/screens/login_screen.dart';
import 'package:flutter_escola_facil/screens/main_screen.dart';
import 'package:flutter_escola_facil/screens/products/product_screen.dart';
import 'package:flutter_escola_facil/screens/red_password_screen.dart';
import 'package:provider/provider.dart';


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
        initialRoute: '/principal',
        routes: {
          //'/': (context) => const TelaSplash(),
          //'/': (context) => const LoginScreen(),
          '/inicial': (context) => const TelaInicial(),
          '/login': (context) => const TelaLogin(),
          '/principal': (context) => const TelaPrincipal(),
          '/product': (context) => const ProductScreen(),
          '/detProduto': (context) => const TelaDetalhesProduto(),
          '/addUsuario': (context) => const TelaAdicionarUsuario(),
          '/redSenha': (context) => const TelaRedefinirSenha(),
          '/carrinho': (context) => const TelaCarrinho(),
          '/encomendas': (context) => const TelaEncomendas(),
        },
      ),
    );
  }
}
