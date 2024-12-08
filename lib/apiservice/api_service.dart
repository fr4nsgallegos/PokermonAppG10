import 'dart:convert';

import 'package:pokemonappg10/models/pokemon_list_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String urlBase =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json?fbclid=IwZXh0bgNhZW0CMTAAAR1NvRhYdIz7HvFIbjRRZryG-5j4516YvSxaCzm4aH6RynNyp9tLZLTGz9Q_aem_OC7UyN2S8ri_YUImzNS2_g";

  Future<PokemonListModel?> getPokemonList() async {
    Uri url = Uri.parse(urlBase);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      PokemonListModel pokemonListModel = PokemonListModel.fromJson(data);
      return pokemonListModel;
    }
    return null;
  }
}
