import 'package:flutter/material.dart';

class AppConstant {
  static const String baseUrl = 'https://newsapi.org/v2';

  static String imageUrl(pokeId) =>
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$pokeId.png';
}

class AssetsConstant {
  // static const String imgPokemonImageTitle = 'assets/img_pokemon_title.png';
}

class ColorConstant {
  //primary
  static Color get primary600 => const Color(0xFF263C66);

  static Color get primary700 => const Color(0xFF162645);

  static Color get primary800 => const Color(0xFF0E1F40);

  static Color get primary900 => const Color(0xFF091733);

  //secondary
  static Color get secondary700 => const Color(0xFFFF7A2E);

  static Color get secondary800 => const Color(0xFFF25D07);

  static Color get secondary900 => const Color(0xFFCC4B00);

  //light
  static Color get light700 => const Color(0xFFFFFFFF);

  static Color get light800 => const Color(0xFFF2F2F2);

  static Color get light900 => const Color(0xFFCCC2C2);
}
