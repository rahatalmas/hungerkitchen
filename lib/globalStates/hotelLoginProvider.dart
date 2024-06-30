import 'package:flutter/cupertino.dart';

class LoginInfoProvider extends ChangeNotifier {
  Future<dynamic>? _loginInfo;
  void setLoginInfo(Future<dynamic> info) {
    _loginInfo = info;
    notifyListeners();
  }
  void unsetLoginInfo(){
    _loginInfo = null;
    notifyListeners();
  }
  Future<dynamic>? get loginInfo => _loginInfo;
}


//final provider = Provider.of<HotelProvider>(context);