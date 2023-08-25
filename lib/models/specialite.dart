class Specialite {
  int id;
  String nom;
  String description;
  String? image;

  Specialite({
    required this.id,
    required this.nom,
    required this.description,
    this.image,
  });

  factory Specialite.fromJson(Map<String, dynamic> json) => Specialite(
        id: json["id"] as int,
        nom: json["nom"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJon() => {
        "id": id,
        "nom": nom,
        "description": description,
        "image": image,
      };
}
