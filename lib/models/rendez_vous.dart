class RendezVous {
  late int? id;
  late String? motif;
  late String? status;
  late DateTime? dateHeure;
  late int? medecin;
  late int? patient;
  late int? specialite;
  RendezVous({
    this.id,
    this.motif,
    this.status,
    this.dateHeure,
    this.medecin,
    this.patient,
    this.specialite,
  });

  factory RendezVous.fromJson(Map<String, dynamic> json) => RendezVous(
        id: json['id'] as int?,
        motif: json['motif'] as String?,
        status: json['status'] as String?,
        dateHeure: DateTime.parse(json['date_heure'] as String),
        medecin: json['medecin'] as int?,
        patient: json['patient'] as int?,
        specialite: json['specialite'] as int?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['motif'] = motif;
    data['status'] = status;
    data['date_heure'] = dateHeure?.toIso8601String();
    data['medecin'] = medecin;
    data['patient'] = patient;
    data['specialite'] = specialite;
    return data;
  }
}
