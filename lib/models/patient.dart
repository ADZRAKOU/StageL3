class Patient {
  String nom;
  String prenom;
  String email;
  String password;
  int contact;
  int autreContact;
  DateTime dateNaissance;
  String genre;
  String adresse;
  bool estAssuree;

  Patient({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password,
    required this.contact,
    required this.autreContact,
    required this.adresse,
    required this.estAssuree,
    required this.dateNaissance,
    required this.genre,
  });
}
