class Personne {
  int id;
  String? nom;
  String? prenom;
  String? email;
  int? specialite;
  String? contact;
  String? autreContact;
  String? adresse;
  Role role;
  Genre genre;

  Personne({
    required this.id,
    required this.nom,
    required this.prenom,
    required this.email,
    required this.specialite,
    required this.contact,
    required this.autreContact,
    required this.adresse,
    required this.role,
    required this.genre,
  });

  factory Personne.fromJson(Map<String, dynamic> json) => Personne(
        id: json["id"] as int,
        nom: json["last_name"],
        prenom: json["first_name"],
        email: json["email"],
        adresse: json["adresse"],
        autreContact: json["autre_contact"],
        contact: json["contact"],
        genre: json["genre"] == "feminin" ? Genre.feminin : Genre.masculin,
        role: Role.patient,
        specialite: json['medecin_specialite'] as int?,
      );

  Map<String, dynamic> toJson() => {
        "last_name": nom,
        "first_name": prenom,
        "email": email,
        "adresse": adresse,
        "contact": contact,
        "autre_contact": autreContact,
        "genre ": genre.name,
        "role": role.name,
        "medecin_specialite": specialite,
      };
}

enum Role {
  patient,
  medecin,
  secretaire,
  personnelSante,
  administrateur,
}

enum Genre { feminin, masculin }
