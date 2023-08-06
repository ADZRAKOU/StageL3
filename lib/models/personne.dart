class Personne {
  String nom;  String prenom;
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

      factory Personne.fromJson(Map<String, dynamic> json) => Personne(
        nom: json["nom"],
        prenom: json["prenom"],
        mail: json["mail"],
        password: json["password"], 
        adresse: json["adresse"],
        autreContact:json ["autreContact"],
        contact: json ["contact"],
        dateNaissance: json ["dateNaissance"],
        estActive:json ["estActive"], 
        estAssure:json ["estAssure"],
        genre:json ["genre"],
        role:json ["role"],
        specialite:json['specialite'] ,
        typeAssurence: json['typeAssurence'],
      );

  Map<String, dynamic> toJson() => {
        "nom": nom,
        "prenom": prenom,
        "mail": mail,
        "password": password,
        "adresse": adresse, 
        "contact": contact,
        "autreContact": autreContact,
        "dateNaissance": dateNaissance,
        "estActive": estActive,
        "estAssure": estAssure,
        "genre ": genre,
        "role": role,
        "specialite":specialite,
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


class Patient extends Personne{
  Patient({required super.nom, required super.prenom, 
  required super.mail, 
  required super.password, 
  required super.dateNaissance, 
  required super.specialite, 
  required super.contact, 
  required super.autreContact, 
  required super.adresse, 
  required super.role, 
  required super.genre, 
  required super.estAssure, 
  required super.typeAssurence, 
  required super.estActive});

}
class Medecin extends Personne{
  Medecin({required super.nom, 
  required super.prenom, 
  required super.mail, 
  required super.password, 
  required super.dateNaissance, 
  required super.specialite, 
  required super.contact, 
  required super.autreContact, 
  required super.adresse, 
  required super.role, 
  required super.genre, 
  required super.estAssure, 
  required super.typeAssurence, 
  required super.estActive});

}