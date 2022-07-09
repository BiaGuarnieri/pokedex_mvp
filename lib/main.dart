import 'package:flutter/material.dart';
import 'package:pokedex/detalhes.dart';
import 'package:pokedex/home_page.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/model/pokemon_repository.dart';
import 'package:pokedex/presenter/presenter_controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PresenterController(PokemonRepository()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/detalhes': (context) => Detalhes(
            item: ModalRoute.of(context)?.settings.arguments as Pokemon),
      },
    );
  }
}
