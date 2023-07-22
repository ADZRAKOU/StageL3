class Personne {
  String nom;
  String prenom;
  String mail;
  String password;
  DateTime dateNaissance;
  String specialite;
  String contact;
  String autreContact;
  String adresse;
  Role role;
  Genre genre;
  bool estAssure;
  String typeAssurence;
  bool estActive;

  Personne(
      {required this.nom,
      required this.prenom,
      required this.mail,
      required this.password,
      required this.dateNaissance,
      required this.specialite,
      required this.contact,
      required this.autreContact,
      required this.adresse,
      required this.role,
      required this.genre,
      required this.estAssure,
      required this.typeAssurence,
      required this.estActive});
}

enum Role {
  patient,
  medecin,
  secretaire,
  personnelSante,
  administrateur,
}

enum Genre { feminin, masculin }
