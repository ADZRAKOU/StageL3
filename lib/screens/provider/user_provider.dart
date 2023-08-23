import 'package:flutter/foundation.dart';
import 'package:masante228/models/personne.dart';
import 'package:masante228/service/user_services.dart';
import 'package:masante228/utils/utils.dart';

class UserProvider with ChangeNotifier {
  final userServices = UserServices();
  Status _status = Status.initial;
  Status get status => _status;

  late Personne? _user = null;
  Personne? get user => _user;

  void signInUser({required String email}) async {
    _status = Status.loading;
    notifyListeners();
    try {
      _user = await userServices.getInfos(email);
      if (_user != null) {
        await userServices.signInUser(email: email);
      }
      _status = Status.loaded;
      notifyListeners();
    } catch (e) {
      _status = Status.error;
      notifyListeners();
    }
  }

  void signUpUser(
      {required String nom,
      required String prenom,
      required String email,
      required String genre,
      required String contact}) async {
    _status = Status.loading;
    notifyListeners();
    try {
      await userServices.signUpUser(
          nom: nom,
          contact: contact,
          email: email,
          prenom: prenom,
          genre: genre);
      _status = Status
          .loaded; // var data = await UserServices().signInUser(email: email);
      notifyListeners();
    } catch (e) {
      if (e.toString() == "Exception: Exists") {
        _status = Status.exist;
      } else {
        _status = Status.error;
      }
      notifyListeners();
    }
  }
}
