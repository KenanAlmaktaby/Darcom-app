import 'dart:convert';

import '../../config/server_config.dart';
import 'package:http/http.dart' as http;

class LogoutService{
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.logout);

  var message;
  var token;

  Future<bool> logout(String? token) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'user_token':token,
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

      return true;
    }else{
      message='server error';
      return false;
    }
  }
}