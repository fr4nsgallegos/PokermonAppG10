import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemonappg10/apiservice/api_service.dart';
import 'package:pokemonappg10/apiservice/pokemon_api.dart';
import 'package:pokemonappg10/models/pokemon_list_model.dart';
import 'package:pokemonappg10/models/task_model.dart';
import 'package:pokemonappg10/widgets/container_pokemon_widget.dart';

class PokemonHomePage extends StatefulWidget {
  @override
  State<PokemonHomePage> createState() => _PokemonHomePageState();
}

class _PokemonHomePageState extends State<PokemonHomePage> {
  PokemonListModel? pokemonListModel;
  // final restclient = RestClient;
  // final dio = Dio();

  late RestClient _restClient;

  void initializeRestclient() {
    final dio = Dio();
    _restClient = RestClient(dio);
  }

  fetchPokemonListModel() async {
    pokemonListModel = await ApiService().getPokemonList();
    setState(() {});
  }

  @override
  void initState() {
    initializeRestclient();
    fetchPokemonListModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () async {
          // List<TaskModel?>? listTask = await _restClient.getTasks().then(
          //   (value) {
          //     print(value);
          //     value.forEach((e) {
          //       print(e.name);
          //     });
          //   },
          // );

          TaskModel task = TaskModel(
              createdAt: "2023-12-13T06:32:36.236Z",
              name: "Denise Schroeder",
              avatar:
                  "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/686.jpg",
              id: "163",
              username: "userName",
              password: "password");

          _restClient.createTask(task);
        }),
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
