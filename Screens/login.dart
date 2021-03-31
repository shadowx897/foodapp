import 'package:flutter/material.dart';
import 'package:foodapp/Scr/Helpers/constants.dart';
import 'package:foodapp/Scr/Helpers/screen_nav.dart';
import 'package:foodapp/Scr/Providers/auth.dart';
import 'package:foodapp/Scr/Screens/home.dart';
import 'package:foodapp/Scr/Screens/registration.dart';
import 'package:foodapp/Scr/Widgets/customtext.dart';
import 'package:foodapp/Scr/Widgets/loading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                          controller: authProvider.password,
                          obscureText: true,
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
                        if(!await authProvider.signIn()){
                          _key.currentState.showSnackBar(
                            SnackBar(content: Text('Login Failed'))
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
                              CustomText(text: 'LOGIN', colors: white, size: 22)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      changeScreen(context, RegistrationScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CustomText(text: 'SIGN UP HERE', size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
