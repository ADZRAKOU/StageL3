import 'package:flutter/foundation.dart';
import 'package:masante228/service/user_services.dart';
import 'package:masante228/utils/utils.dart';

class UserProvider with ChangeNotifier {
  Status _status = Status.initial;
  Status get status => _status;

  void signInUser({required String email}) async {
    _status = Status.loading;
    notifyListeners();
    try {
      // var data = await UserServices().signInUser(email: email);
      await UserServices().signInUser(email: email);
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
      // var data = await UserServices().signInUser(email: email);
      await UserServices().signUpUser(
          nom:'nom',
          contact: 'contact',
          email: 'email',
          prenom: 'prenom',
          genre: 'genre');
      _status = Status.loaded;
      notifyListeners();
    } catch (e) {
      _status = Status.error;
      notifyListeners();
    }
  }
}
