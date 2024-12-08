import 'package:flutter/material.dart';
import 'package:pokemonappg10/pages/provider/dog_provider.dart';
import 'package:pokemonappg10/pages/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerUser = Provider.of<UserProvider>(context);
    final providerDog = Provider.of<DogProvider>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Info del provider: ${providerUser.name}"),
            ElevatedButton(
              onPressed: () {
                providerUser.name = "Jhonny";
              },
              child: Text("Cambiar nombre de usuario"),
            ),
            Divider(),
            Text(providerDog.name),
            ElevatedButton(
              onPressed: () {
                providerDog.name = "Bobby";
              },
              child: Text("Cambiar nombre del perro"),
            ),
          ],
        ),
      ),
    );
  }
}
