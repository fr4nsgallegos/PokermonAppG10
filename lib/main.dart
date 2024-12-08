import 'package:flutter/material.dart';
import 'package:pokemonappg10/pages/home_page.dart';
import 'package:pokemonappg10/pages/pokemon_home_page.dart';
import 'package:pokemonappg10/provider/dog_provider.dart';
import 'package:pokemonappg10/provider/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ProviderExample(),
  );
}

class ProviderExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => DogProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        home: PokemonHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
