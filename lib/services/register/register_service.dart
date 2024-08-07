import 'dart:convert';
import 'package:dar_com/config/server_config.dart';
import 'package:http/http.dart' as http;

import '../../models/user.dart';

class RegisterService {
  var url = Uri.parse(ServerConfig.domainNameServer + ServerConfig.register);

  var message;

  Future<bool> register(User user) async {
    var response = await http.post(url, headers: {
      'Accept': 'application/json'
    }, body: {
      'name': user.name,
      'email': user.email,
      'phone': user.phone,
      'password': user.password,
    });

    print(response.statusCode);
    print(response.body);

    if(response.statusCode==200){
      var jsonResponse=jsonDecode(response.body);
      message=jsonResponse['msg'];
      return true;
    }else
      return false;
    }
  }
