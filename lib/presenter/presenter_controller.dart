import 'package:flutter/cupertino.dart';

import 'package:pokedex/model/pokemon_repository.dart';

import '../model/pokemon.dart';

class PresenterController with ChangeNotifier {
  final PokemonRepository _repository;
// precisa usar o ChangeNotifier usando with por ser MultiProvider
//se fosse apenas Provider usaria extends

  PresenterController(this._repository);
  List<Pokemon> pokemonList = [];
  bool loading = true;

  void getPokemon() {
    loading = true;
    _repository.getPokemon().then((value) {
      pokemonList = value;
      notifyListeners(); // escuta e notifica o que está sendo solicitado
      loading = false;
    });
  }
}
