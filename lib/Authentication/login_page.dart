import 'package:best_flutter_ui_templates/Animation_Services/Another_animation.dart';
import 'package:best_flutter_ui_templates/forgotten_Password.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../fitness_app/fitness_app_home_screen.dart';
import '../Animation_Services/delayed_animation.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double password_strength = 0;
  int currentIndex = 0;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  bool validatePassword(String pass){
    String _password = pass.trim();
    if(_password.isEmpty){
      setState(() {
        password_strength = 0;
      });
    }else if(_password.length < 6 ){
      setState(() {
        password_strength = 1 / 4;
      });
    }else if(_password.length < 8){
      setState(() {
        password_strength = 2 / 4;
      });
    }else{
      if(pass_valid.hasMatch(_password)){
        setState(() {
          password_strength = 4 / 4;
        });
        return true;
      }else{
        setState(() {
          password_strength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: DelayedAnimation(
                  delay: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: (){
                            setState(() {
                              currentIndex = 0;
                            });
                          },
                          child: Text("SignIn", style: currentIndex == 0 ? TextStyle(color: Colors.blue, fontSize: 35):
                          TextStyle(color: Colors.blueGrey, fontSize: 25))
                      ),
                      const SizedBox(width: 10),
                      TextButton(
                          onPressed: (){
                            setState(() {
                              currentIndex = 1;
                            });
                          },
                          child: Text("SignUp", style: currentIndex == 1 ? TextStyle(color: Colors.blue, fontSize: 35):
                          TextStyle(fontSize: 25, color: Colors.blueGrey))
                      ),
                    ],
                  )
              ),
            ),
            SizedBox(height: 35),
            currentIndex == 0 ? loginForm(context) : registrationForm(context),

          ],
        ),
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: [
          DelayedAnimation(
            delay: 200,
            child: Text(
                "Connectez-vous pour bénéficier des points de fidélité",
                style: TextStyle(color: Colors.blue, fontSize: 15)
            )
          ),
          SizedBox(height: 20),
          DelayedAnimation(
            delay: 500,
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                labelText: 'Your Email',
                prefixIcon: Icon(Icons.mail_rounded),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                )
              )
            )
          ),
          SizedBox(height: 30),
          DelayedAnimation(
            delay: 700,
            child: TextFormField(
              obscureText: _obscureText,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0),),
                labelStyle: TextStyle(
                  color: Colors.grey[400],
                ),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.visibility,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  }
                )
              )
            )
          ),
          SizedBox(height: 50),
          DelayedAnimation(
            delay: 900,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                padding: EdgeInsets.symmetric(
                  horizontal: 125,
                  vertical: 13,
                )
              ),
              child: Text(
                  'SignIn',
                  style: TextStyle(color: Colors.white)
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.topToBottom,duration: const Duration(milliseconds: 400),
                      child: FitnessAppHomeScreen()),
                );
              }
            )
          ),
          SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 35),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(type: PageTransitionType.fade,duration: const Duration(milliseconds: 400),
                        child: ForgottenPassword()),
                  );
                },
                child: DelayedAnimation(
                  delay: 1100,
                  child: Text(
                    "Mot de pass oublié?",
                  )
                )
              )
            )
          ),
          SizedBox(height: 10),
          Divider(color: Colors.blue),
          SizedBox(height: 10),
          Center(
            child: Text("Or"),
          ),
          SizedBox(height: 20),
          AnotherDelayedAnimation(
              delay: 1300,
              child: GestureDetector(
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        width: 2,
                        color: Colors.blue
                    ),
                    color: Colors.white,
                  ),
                  child: AnotherDelayedAnimation(delay: 1600,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 3),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/images/240_F_391792593_BYfEk8FhvfNvXC5ERCw166qRFb8mYWya.jpeg",
                                    )
                                )
                            ),
                          ),
                          Text(" SignIn with Google", style: TextStyle(letterSpacing: 1.5, color: Colors.blue),)
                        ],
                      ),
                  )
                )
              )
          ),
        ]
      )
    );
  }

  Widget registrationForm(BuildContext context){
    return Container(
        margin: EdgeInsets.symmetric(
        horizontal: 30,
    ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            DelayedAnimation(
              delay: 200,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Nom',
                  prefixIcon: Icon(Icons.person_outlined),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  )
                )
              )
            ),
            SizedBox(height: 10),
            DelayedAnimation(
              delay: 400,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Prenom',
                  prefixIcon: Icon(Icons.person_sharp),
                  labelStyle: TextStyle(
                    color: Colors.grey[400]
                  )
                )
              )
            ),
            SizedBox(height: 10),
            DelayedAnimation(
              delay: 600,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Your Email',
                  prefixIcon: Icon(Icons.mail_rounded),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  )
                )
              )
            ),
            SizedBox(height: 10),
            DelayedAnimation(
              delay: 800,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Mot de Pass',
                  prefixIcon: Icon(Icons.lock),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                validator: (inputValue){
                  if(inputValue!.isEmpty){
                    return "Please Enter Password";
                  }/*else{
                    bool result = validatePassword(inputValue);
                    if(result){
                      // create account event
                      return null;
                    }*/else{
                      return " Password should contain Capital, small letter & Number & Special";
                    }
                }
              )
            ),
            SizedBox(height: 10),
            DelayedAnimation(
              delay: 1000,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                  labelText: 'Mot de Pass',
                  prefixIcon: Icon(Icons.lock),
                  labelStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
                validator: (inputValue){
                  if(inputValue!.isEmpty){
                    return "Please Enter Password";
                  }/*if(inputValue != passwordController.text){
                    return "Not Match";
                  }*/
                  /*else{
                    bool result = validatePassword(inputValue);
                    if(result){
                      // create account event
                      return null;
                    }else{
                      return " Password should contain Capital, small letter & Number & Special";
                    }
                  }*/
                },
              ),
            ),
            SizedBox(height: 100),
            DelayedAnimation(
              delay: 1200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 125,
                    vertical: 13,
                  ),
                ),
                child: Text(
                    'Sign Up',
                    style: TextStyle(color: Colors.white)
                ),
                onPressed: () {
                  setState(() {
                    currentIndex = 0;
                  });
                }
              )
            ),
          ]
        )
      )
    );
  }
}
