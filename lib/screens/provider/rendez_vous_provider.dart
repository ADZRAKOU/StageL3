import 'package:flutter/foundation.dart';
import 'package:masante228/models/rendez_vous.dart';
import 'package:masante228/service/rendez_vous_services.dart';
import 'package:masante228/utils/utils.dart';

class RendezVousProvider with ChangeNotifier {
  final _rendezVousServices = RendezVousServices();

  Status _status = Status.initial;
  Status get status => _status;

  late RendezVous? _rendezVous;
  RendezVous? get rendezVous => _rendezVous;

  List<RendezVous> _rendezVouss = [];
  List<RendezVous> get rendezVouss => _rendezVouss;

  void saveRendezVous({required RendezVous rendezVous}) async {
    _status = Status.loading;
    try {
      _rendezVous = await _rendezVousServices.save(rendezVous);
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
      _rendezVouss = await _rendezVousServices.getAll();
      _status = Status.loaded;
      notifyListeners();
    } catch (e) {
      _status = Status.error;
      notifyListeners();
    }
  }
}
