import 'package:flutter/foundation.dart';

class UniModel with ChangeNotifier{
  String sortBy = 'Name';

  void updateSortBy(String data){
    sortBy = data;
    // print('sortBy $sortBy');
    notifyListeners();
  }
}
