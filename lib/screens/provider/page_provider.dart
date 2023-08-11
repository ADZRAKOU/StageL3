import 'package:flutter/foundation.dart';
import 'package:masante228/utils/screens_utils.dart';

class PageProvider with ChangeNotifier {
  Pages _page = Pages.dashboard;
  Pages get page => _page;

  void setPageInArborescence({required Pages pageToSet}) {
    _page = pageToSet;
    notifyListeners();
  }
}
