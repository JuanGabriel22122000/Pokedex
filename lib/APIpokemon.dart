import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminstraitorJson {
  final dio = Dio();
  final url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  Future<List<Pokemom>> GetPokemons() async {
    final response = await dio.get(url);
    final json = jsonDecode(response.data);
    final body = json['pokemon'] as List;
    final pokemons = body.map((e) => Pokemom.fromJason(e)).toList();
    return pokemons;
  }
}

class Pokemom {
  String name;
  String image;
  List<dynamic> poderes;

  Pokemom({
    required this.name,
    required this.image,
    required this.poderes,
  });

  static Pokemom fromJason(Map map) {
    return Pokemom(
      name: map['name'],
      image: map['img'],
      poderes: map['type'],
    );
  }

  Color get baseColor => color(type: poderes[0]);

  static Color color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown;
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent;
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange;
      case 'Flying':
        return Colors.indigo;
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen;
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo;
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo;
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent;
      default:
        return Colors.grey;
    }
  }
}
