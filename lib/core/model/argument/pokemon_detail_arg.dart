class PokemonDetailArg {
  const PokemonDetailArg({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  final int id;
  final String imageUrl;
  final String name;
}
