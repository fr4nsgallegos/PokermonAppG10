import 'package:flutter/material.dart';
import 'package:pokemonappg10/pages/home_page2.dart';
import 'package:pokemonappg10/provider/dog_provider.dart';
import 'package:pokemonappg10/provider/user_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final providerDog = Provider.of<DogProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<UserProvider>(
              builder: (context, user, _) => Text(user.name),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage2(),
                  ),
                );
              },
              child: Text("go home page2"),
            ),
            Divider(),
            Text("Nombre del perro: ${providerDog.name}")
          ],
        ),
      ),
    );
  }
}
