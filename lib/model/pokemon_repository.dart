import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/model/pokemon.dart';

class PokemonRepository {
  Future<List<Pokemon>> getPokemon() async {
    var url = Uri.parse('http://104.131.18.84/pokemon/?limit=50&page=0');
    List<Pokemon> pokemonlist = [];
    return http.get(url).then((response) {
      if (response.statusCode == 200) {
        Map json = const JsonDecoder().convert(response.body);
        for (var elements in (json['data'] as List)) {
          pokemonlist.add(Pokemon.fromJson(elements));
        }
      }
      return pokemonlist;
    });
  }
}
