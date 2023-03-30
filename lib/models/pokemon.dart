class Pokemon {
  String name;
  String imageURL;
  String type;
  int weight;

  Pokemon({
    required this.name,
    required this.imageURL,
    required this.type,
    required this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      imageURL: json['imageURL'],
      type: json['type'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageURL': imageURL,
        'type': type,
        'weight': weight,
      };
  @override
  String toString() {
    return "Pokemon Name: $name | Type: $type | Weight: $weight | PictureUrl: $imageURL";
  }
}
