import 'package:best_flutter_ui_templates/Animation_Services/Another_animation.dart';
import 'package:best_flutter_ui_templates/Animation_Services/delayed_animation.dart';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io' as plateform;

class ForgottenPassword extends StatefulWidget {
  @override
  _ForgottenPasswordState createState() => _ForgottenPasswordState();
}

class _ForgottenPasswordState extends State<ForgottenPassword> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
      color: isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
      padding: EdgeInsets.only(left: 30, right: 30),
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor:
          isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
          body: Column(
            children: <Widget>[
              SizedBox(height: 50),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(plateform.Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back_sharp),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
              ),
              AnotherDelayedAnimation(delay: 200,
                  child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top,
                          left: 16,
                          right: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.blueGrey),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Icon(FontAwesomeIcons.lock, size: 100,color: Colors.blueGrey,)
                      )
                  ),
              ),
              DelayedAnimation(delay: 400,
                  child: Container(
                    padding: const EdgeInsets.only(top: 25),
                    child: Text(
                      'RESET PASSWORD',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                          color: isLightMode ? Colors.black : Colors.white),
                    ),
                  ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  'Please enter your email address below',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      color: isLightMode ? Colors.black : Colors.white),
                ),
              ),
              SizedBox(height: 30),
              DelayedAnimation(
                  delay: 600,
                  child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                          labelText: 'Your Email',
                          hintText: "your_email@example.com",
                          prefixIcon: Icon(Icons.mail_rounded),
                          labelStyle: TextStyle(
                            color: Colors.grey[400],
                          )
                      )
                  )
              ),
              SizedBox(height: 30),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isLightMode ? Colors.blue : Colors.white,
                    borderRadius:
                    const BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          offset: const Offset(4, 4),
                          blurRadius: 8.0),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Reset',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              letterSpacing: 3,
                              color:
                              isLightMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
