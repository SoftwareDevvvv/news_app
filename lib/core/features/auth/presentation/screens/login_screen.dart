import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/constants/assets%20manager/constants.dart';
import 'package:news_app/core/features/auth/presentation/screens/signup_screen.dart';
import 'package:news_app/core/features/news/data/repository/news_repository.dart';
import 'package:news_app/core/features/news/logic/news_bloc.dart';
import 'package:news_app/core/features/news/presentation/screens/news_screen.dart';

import '../../../../constants/assets manager/assets_manager.dart';
import '../../../news/logic/news_states.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange[300]!, Colors.orangeAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AssetsManager.logo, height: 100),
                const SizedBox(height: 20),
                Text(
                  Constants.welcomeText,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                _buildTextField(
                  hintText: Constants.emailHintText,
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                _buildTextField(
                  hintText: Constants.passwordHintText,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => NewsBloc(
                                      initialState: NewsInitState(),
                                      newsRepository: NewsRepository()),
                                  child: const NewsScreen(),
                                )));
                  },
                  child: Text(Constants.loginText),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupScreen(),
                        )); 
                  },
                  child: Text(
                    Constants.dontHaveAnAccount,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  Constants.orContinueWithText,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 20),
                _buildSocialLoginButton(
                  text: Constants.continueWithGoogleText,
                  image: AssetsManager.googleLogo,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => NewsBloc(
                                      initialState: NewsInitState(),
                                      newsRepository: NewsRepository()),
                                  child: const NewsScreen(),
                                )));
                  },
                ),
                const SizedBox(height: 10),
                _buildSocialLoginButton(
                  text: Constants.continueWithAppleText,
                  image: AssetsManager.appleLogo,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BlocProvider(
                                  create: (context) => NewsBloc(
                                      initialState: NewsInitState(),
                                      newsRepository: NewsRepository()),
                                  child: const NewsScreen(),
                                )));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String hintText,
      required IconData icon,
      bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white24,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
    );
  }

  Widget _buildSocialLoginButton(
      {required String text,
      required String image,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white54),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 24),
            const SizedBox(width: 10),
            Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
