import 'package:flutter/material.dart';
import 'package:foodapp/Scr/Providers/auth.dart';
import 'package:foodapp/Scr/Screens/home.dart';
import 'package:foodapp/Scr/Screens/login.dart';
import 'package:foodapp/Scr/Widgets/loading.dart';
import 'package:provider/provider.dart';
import 'Scr/Helpers/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AuthProvider.initialize())
  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ScreenController(),
    )));
}

class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch(auth.status){
      case Status.Uninitialized:
      return Loading();
    case Status.Unauthenticated:
    case Status.Authenticating:
      return LoginScreen();
    case Status.Authenticated:
      return Home();
    default: return LoginScreen();
  }
  }
}