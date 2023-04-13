import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:random_user_detail/screens/home/provider/homeProvider.dart';
import 'package:random_user_detail/screens/home/view/home_screen.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => homeProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => home_screen(),
        },
      ),
    ),
  );
}