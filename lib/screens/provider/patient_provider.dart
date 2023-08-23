import 'package:flutter/foundation.dart';
import 'package:masante228/models/patient.dart';
import 'package:masante228/service/patient_services.dart';
import 'package:masante228/utils/utils.dart';

class PatientProvider with ChangeNotifier {
  final patientService = PatientServices();
  Status _status = Status.initial;
  Status get status => _status;

  late Patient? _patient;
  Patient? get patient => _patient;

  void getInfos({required String email}) async {
    _status = Status.loading;
    notifyListeners();
    try {
      _patient = await patientService.getInfos(email);
      _status = Status.loaded;
      notifyListeners();
    } catch (e) {
      _status = Status.error;
      notifyListeners();
    }
  }
}
