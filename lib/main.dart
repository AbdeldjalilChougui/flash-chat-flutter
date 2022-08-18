import 'package:flutter/material.dart';
import 'package:flash_chat/screens/welcome_screen.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/screens/chat_screen.dart';

// TODO add firebase configs
void main() => runApp(FlashChat());

class FlashChat extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
                textTheme: TextTheme(
                    bodyText1: TextStyle(color: Colors.black54),
                ),
            ),
            routes: {
                WelcomeScreen.id: (context) => WelcomeScreen(),
                ChatScreen.id: (context) => ChatScreen(),
                LoginScreen.id: (context) => LoginScreen(),
                RegistrationScreen.id: (context) => RegistrationScreen(),
            },
            initialRoute: WelcomeScreen.id,
        );
    }
}