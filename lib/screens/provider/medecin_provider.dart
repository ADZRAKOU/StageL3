import 'package:flutter/foundation.dart';
import 'package:masante228/models/medecin.dart';
import 'package:masante228/service/medecin_services.dart';
import 'package:masante228/utils/utils.dart';

class MedecinProvider with ChangeNotifier {
  final _medecinServices = MedecinServices();

  Status _status = Status.initial;
  Status get status => _status;

  late Medecin? _medecin;
  Medecin? get medecin => _medecin;

  List<Medecin> _medecins = [];
  List<Medecin> get medecins => _medecins;

  void saveMedecin({required Medecin medecin}) async {
    _status = Status.loading;
    try {
      _medecin = await _medecinServices.save(medecin);
      _status = Status.loaded;
      notifyListeners();
    } catch (e) {
      _status = Status.error;
      notifyListeners();
    }
  }

  void getAll() async {
    _status = Status.loading;
    try {
      _medecins = await _medecinServices.getAll();
      _status = Status.loaded;
      notifyListeners();
    } catch (e) {
      _status = Status.error;
      notifyListeners();
    }
  }
}
