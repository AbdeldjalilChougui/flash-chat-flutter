import 'dart:io';

import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../components/button_style.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = "welcome";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with TickerProviderStateMixin{

  AnimationController controllerImageSize;
  AnimationController controllerBgColor;
  AnimationController controllerLoading;
  AnimationController controllerTween;
  Animation animation;
  Animation animation2;

  @override
  void initState() {
    super.initState();
    sleep(Duration(seconds: 3));
    controllerImageSize = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    controllerImageSize.forward(); // controllerImageSize.reverse(from: 1);
    controllerImageSize.addListener(() {
      setState(() {});
    });

    // Curved Animation
    animation = CurvedAnimation(
      parent: controllerImageSize,
      curve: Curves.decelerate,
    );

    // loop Animation
    /*animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllerImageSize.reverse(from: 1);
      }
      else if (status == AnimationStatus.dismissed) {
        controllerImageSize.forward();
      }
    });*/

    controllerTween = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    controllerTween.forward();
    controllerTween.addListener((){
      setState(() {});
    });

    animation2 = ColorTween(
      begin: Colors.red,
      end: Colors.cyan,
    ).animate(controllerTween);

    controllerBgColor = AnimationController(
      duration: Duration(seconds: 3,),
      vsync: this,
    );
    controllerBgColor.forward();
    controllerBgColor.addListener(() {
      setState(() {});
    });
    
    controllerLoading = AnimationController(
      duration: Duration(seconds: 3,),
      vsync: this,
      upperBound: 100,
    );
    controllerLoading.forward();
    controllerLoading.addListener((){
      setState(() {});
    }); //"${controllerLoading.value}%"   from 0% to 100%
  }

  @override
  void dispose() {
    controllerImageSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(controllerBgColor.value), //anim2.value;
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "logo",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: animation.value*60,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ["Flash Chat"],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            MyButtonStyle(
              color: Colors.lightBlueAccent,
              text: 'Log In',
              onPress: (){Navigator.pushNamed(context, LoginScreen.id);}
            ),
            MyButtonStyle(
              color: Colors.blueAccent,
              text: 'Register',
              onPress: (){Navigator.pushNamed(context, RegistrationScreen.id);},
            ),
          ],
        ),
      ),
    );
  }
}