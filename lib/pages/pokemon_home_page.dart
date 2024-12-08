import 'package:flutter/material.dart';
import 'package:pokemonappg10/apiservice/api_service.dart';
import 'package:pokemonappg10/models/pokemon_list_model.dart';
import 'package:pokemonappg10/widgets/container_pokemon_widget.dart';

class PokemonHomePage extends StatefulWidget {
  @override
  State<PokemonHomePage> createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage> {
  PokemonListModel? pokemonListModel;

  fetchPokemonListModel() async {
    pokemonListModel = await ApiService().getPokemonList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchPokemonListModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: pokemonListModel == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Text("Tu pokedex"),
                    Text(
                        "¿Quién es este pokemon? Busca el pokemon de tu preferencia y observa sus cualidades"),
                    Expanded(
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.93,
                        ),
                        children: [
                          ...pokemonListModel!.pokemon
                              .map(
                                (pokemon) => ContainerPokemonWidget(pokemon),
                              )
                              .toList()
                        ],
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
