class Patient {
  String nom;
  String prenom;
  String email;
  int contact;
  DateTime dateNaissance;
  String genre;
  String adresse;
  String role;
  bool estAssuree;

  Patient({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.contact,
    required this.role,
    required this.adresse,
    required this.estAssuree,
    required this.dateNaissance,
    required this.genre,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
      nom: json["last_name"],
      prenom: json["first_name"],
      email: json["email"],
      contact: json["contact"],
      role: json["role"],
      adresse: json["adresse"],
      estAssuree: json["est_assuree"] as bool,
      dateNaissance: DateTime.parse(json["date_naissance"]),
      genre: json["genre"]);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data["last_name"] = nom;
    data["first_name"] = prenom;
    data["email"] = email;
    data["contact"] = contact;
    data["role"] = role;
    data["adresse"] = adresse;
    data["est_assuree"] = estAssuree;
    data["date_naissance"] = dateNaissance.toIso8601String();
    data["genre"] = genre;
    return data;
  }
}
