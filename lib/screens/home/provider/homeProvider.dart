import 'dart:math';

import 'package:flutter/material.dart';
import 'package:random_user_detail/screens/home/model/homeModel.dart';
import 'package:random_user_detail/utils/home_helper.dart';

class homeProvider extends ChangeNotifier
{
  Future<UserModel> userApiCall()
  async {
    home_helper h1 = home_helper();

    UserModel u1 = await h1.userApi();
    return u1;
  }

  int index = 0;

  void changeIndex()
  {
    Random randnum = Random();
    index = randnum.nextInt(5);
    notifyListeners();
  }

}