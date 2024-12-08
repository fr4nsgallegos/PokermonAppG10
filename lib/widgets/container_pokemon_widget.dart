import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:pokemonappg10/models/pokemon_list_model.dart';

class ContainerPokemonWidget extends StatefulWidget {
  Pokemon pokemon;
  ContainerPokemonWidget(this.pokemon);
  @override
  State<ContainerPokemonWidget> createState() => _ContainerPokemonWidgetState();
}

class _ContainerPokemonWidgetState extends State<ContainerPokemonWidget> {
  late Future<Color?> _dominantColor;

  Future<Color?> _getDominantColor(String urlImage) async {
    final imageProvider = NetworkImage(urlImage);
    final paletteGenerator =
        await PaletteGenerator.fromImageProvider(imageProvider);
    return paletteGenerator.vibrantColor?.color;
  }

  @override
  void initState() {
    _dominantColor = _getDominantColor(widget.pokemon.img);
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dominantColor,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final Color dominantColor = snapshot.data ?? Colors.white;
        return Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: dominantColor.withOpacity(0.4),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.pokemon.name,
                      maxLines: 2,
                    ),
                  ),
                  Icon(Icons.favorite_border),
                ],
              ),
              Image.network(widget.pokemon.img),
            ],
          ),
        );
      },
    );
  }
}
