import 'package:flutter/material.dart';
import 'package:foodapp/Scr/Helpers/constants.dart';
import 'package:foodapp/Scr/Helpers/screen_nav.dart';
import 'package:foodapp/Scr/Providers/auth.dart';
import 'package:foodapp/Scr/Screens/home.dart';
import 'package:foodapp/Scr/Screens/login.dart';
import 'package:foodapp/Scr/Widgets/customtext.dart';
import 'package:foodapp/Scr/Widgets/loading.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'Images/logo.png',
                        width: 250,
                        height: 250,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: authProvider.name,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Username',
                            icon: Icon(Icons.person),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: authProvider.email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Email Address',
                            icon: Icon(Icons.email),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: black),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          controller: authProvider.password,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Password',
                            icon: Icon(Icons.lock),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                    child: GestureDetector(
                      onTap: () async{
                        if(!await authProvider.signUp()){
                          _key.currentState.showSnackBar(
                            SnackBar(content: Text('Registration Failed'))
                          );
                          return;
                        }
                        authProvider.clearController();
                        changeScreenReplace(context, Home());
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: pink,
                            border: Border.all(color: black),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomText(
                                  text: 'REGISTER', colors: white, size: 22)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      changeScreen(context, LoginScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(text: 'LOG IN HERE', size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
