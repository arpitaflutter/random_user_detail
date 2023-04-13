
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_user_detail/screens/home/model/homeModel.dart';

class home_helper
{
  Future<UserModel> userApi()
  async {
    String link = "https://randomuser.me/api";

    Uri uri = Uri.parse(link);

    var response = await http.get(uri);

    var json = jsonDecode(response.body);

    UserModel u1 = UserModel.fromJson(json);

    return u1;
  }
}