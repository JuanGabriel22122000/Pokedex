import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('APIpokemon funciona classe', () async {
    final dio = Dio();
    final url =
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

    final response = await dio.get(url);
    final json = jsonDecode(response.data);
    final body = json['pokemon'] as List;
    final pokemons = body.map((e) => Pokemom.fromJason(e)).toList();
  });
}

class Pokemom {
  String name;
  String image;
  List<dynamic> poderes;

  Pokemom({required this.name, required this.image, required this.poderes});

  static Pokemom fromJason(Map map) {
    return Pokemom(name: map['name'], image: map['img'], poderes: map['type']);
  }
}
