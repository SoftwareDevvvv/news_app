import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_blur/image_blur.dart';
import 'package:news_app/core/features/auth/presentation/screens/login_screen.dart';
import 'package:news_app/core/theme/theme.dart';


void main() async{
  await dotenv.load(fileName: ".env");
  await ImageBlur.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
        title: 'Flutter News App',
        theme: CustomTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
    );
  }
}

