import 'package:flutter/cupertino.dart';
import 'package:hungerkitchen/models/hotelModel.dart';

class LoginInfoProvider extends ChangeNotifier {
  Future<HotelLoginResponse>? _loginInfo;
  void setLoginInfo(Future<HotelLoginResponse> info) {
    _loginInfo = info;
    notifyListeners();
  }
  void unsetLoginInfo(){
    _loginInfo = null;
    notifyListeners();
  }
  Future<HotelLoginResponse>? get loginInfo => _loginInfo;
  
  


}


//final provider = Provider.of<HotelProvider>(context);