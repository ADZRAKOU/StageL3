class Medecin {
  int? id;
  String? nom;
  String? prenom;
  int? specialite;
  String email;
  String? genre;
  String? contact;
  String? autreContact;
  String? adresse;

  Medecin({
    required this.id,
    required this.specialite,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.genre,
    required this.contact,
    required this.autreContact,
    required this.adresse,
  });

  factory Medecin.fromJson(Map<String, dynamic> json) {
    return Medecin(
      id: json["id"],
      nom: json['last_name'],
      prenom: json['first_name'],
      specialite: json['medecin_specialite'] as int?,
      email: json['email'],
      genre: json['genre'],
      contact: json['contact'],
      autreContact: json['autre_contact'],
      adresse: json['adresse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'last_name': nom,
      'first_name': prenom,
      'medecin_specialite': specialite,
      'email': email,
      'genre': genre,
      'contact': contact,
      'autre_contact': autreContact,
      'adresse': adresse,
    };
  }
}
