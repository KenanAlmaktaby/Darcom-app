import 'dart:convert';
import 'package:dar_com/config/server_config.dart';
import 'package:dar_com/config/user_information.dart';
import 'package:dar_com/native_storage/secure_storage.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';

class LoginService {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.login);

  var message;
  var token;
  var name;
  var email;
  var phone;
  var data;

  Future<bool> login(User user,bool checkBox) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'email': user.email,
      'password': user.password,
    });

    print(response.statusCode);
    print(response.body);

    var jsonResponse=jsonDecode(response.body);

    if(response.statusCode==200 && jsonResponse['state']==false) {
      message=jsonResponse['msg'];
      return false;}
    if(response.statusCode==200){
      var jsonResponse=jsonDecode(response.body);
      message=jsonResponse['msg'];
      data=jsonResponse['data']['user'];
      name=data['name'];
      email=data['email'];
      phone=data['phone'];
      token=jsonResponse['data']['token'];
      UserInformation.USER_TOKEN=token;
      if(checkBox){
        SecureStorage storage=SecureStorage();
        await storage.save('token', UserInformation.USER_TOKEN);
      }
      return true;
    }else{
      message='server error';
      return false;
    }
  }
}
