
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../design_course/gradient_header.dart';

//import 'package:http/http.dart' as http;

// ignore: camel_case_types
class login extends StatefulWidget {
  static const String routeName = 'login';
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {

  //final storage = const FlutterSecureStorage();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  late Box box;
  bool isChecked1 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createBox();
  }

  void createBox() async{
    box = await Hive.openBox('User_box');
    getdata();
  }
  void getdata()async{
    if(box.get('useremail')!=null){
      emailController.text = box.get('useremail');
      isChecked1 = true;
      setState(() {
      });
    }
    if(box.get('password')!=null){
      passwordController.text = box.get('password');
      isChecked1 = true;
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      bottomSheet: _buildBottomSheet(),
    );
  }

  Widget _buildBottomSheet() {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 10),
          Text("Developed By: shinTheo",
              style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  RegExp passwordValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");
  double passwordStrength = 0;

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (_password.isEmpty) {
      setState(() {
        passwordStrength = 0;
      });
    } else if (_password.length < 6) {
      setState(() {
        passwordStrength = 1 / 4;
      });
    } else if (_password.length < 8) {
      setState(() {
        passwordStrength = 2 / 4;
      });
    } else {
      if (passwordValid.hasMatch(_password)) {
        setState(() {
          passwordStrength = 4 / 4;
        });
        return true;
      } else {
        setState(() {
          passwordStrength = 3 / 4;
        });
        return false;
      }
    }
    return false;
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 20),
          _buildForm(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return AppHeaderGradient(
      fixedHeight: MediaQuery
          .of(context)
          .size
          .height * .20,
      isProfile: false,
      text: 'Connexion',
    );
  }

  final _formKey = GlobalKey<FormState>();
  bool isValidForm = false;
  bool _isObscure = true;
  bool isloading = false;

  Widget _buildForm(BuildContext context) {
    return Form(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: emailController,
                  autofocus: false,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Address Mail',
                    labelText: 'Email',
                    filled: true,
                    icon: const Icon(Icons.email_outlined),
                  ),
                  validator: (inputValue) {
                    if (inputValue!.isEmpty) {
                      return "field Required!";
                    }
                  },
                ),
                const SizedBox(height: 15.0),
                TextFormField(
                  controller: passwordController,
                  obscureText: _isObscure,
                  autofocus: false,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
                    hintText: 'Mot de Pass',
                    labelText: 'Mot de Pass',
                    filled: true,
                    icon: const Icon(Icons.lock),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    }, icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    ),
                  ),
                  validator: (inputValue) {
                    if (inputValue!.isEmpty) {
                      return "field Required!";
                    }
                  },
                ),

                Row(
                  children: [
                    Checkbox(
                      value: isChecked1,
                      onChanged: (value){
                        isChecked1 = !isChecked1;
                        setState(() {
                        });
                      },
                    ),
                    Text("Se souvenir de moi"),

                  ],
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    //Navigator.pushReplacementNamed(
                        //context, SignUp.routeName);
                  },
                  child: Text(
                    'Mot de Pass oublié?',style: TextStyle(color: Colors.blue) ),
                  ),

                const SizedBox(height: 10.0),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      isValidForm = true;

                      setState(() => isloading = true);
                      await login();
                      setState(() => isloading = false);
                    }
                    else {
                      setState(() {
                        isValidForm = false;
                      });
                    }
                  },
                  child: (isloading)
                      ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1.5,
                      )) : Text("Connexion"),
                ),

                const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text("Pas encore de Conte?"),
                    TextButton(
                      onPressed: () {
                        /*Navigator.push(
                          context,
                          PageTransition(type: PageTransitionType.fade,duration: const Duration(milliseconds: 500),
                              child: const SignUp()),
                        );*/
                      },
                      child: Text(
                        "SignUp"),
                    ),
                  ],
                ),

                //Authentification through gmail Standby

                /*Padding(
                  child: Text('Login with Google',
                    style: FontStyles.montserratRegular14().copyWith(
                        color: Colors.black45)),
                  padding: const EdgeInsets.fromLTRB(60, 60, 60, 20),
                ),
                GestureDetector(
                  onTap: () {
                    function();
                    Navigator.pushReplacementNamed(context, mainhome.routeName);
                  },
                  child: SizedBox(
                    height: 50.0,
                    width: 50.0,
                    child: Image.asset("assets/images/google.png"),
                  ),
                ),*/
              ],
            ),

          ),
        ));
  }

//final data = await request.fields;

  void storeLoginDetails() {
    box.put('useremail', emailController.text);
    box.put('password', passwordController.text);
  }
}
