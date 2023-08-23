class Medecin {
  String nom;
  String prenom;
  int specialite;
  String email;
  String genre;
  String contact;
  String autreContact;
  String adresse;

  Medecin({
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
      nom: json['nom'],
      prenom: json['prenom'],
      specialite: json['medecin_specialite'] as int,
      email: json['email'],
      genre: json['genre'],
      contact: json['contact'],
      autreContact: json['autre_contact'],
      adresse: json['adresse'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'prenom': prenom,
      'specialite': specialite,
      'email': email,
      'genre': genre,
      'contact': contact,
      'autreContact': autreContact,
      'adresse': adresse,
    };
  }
}
