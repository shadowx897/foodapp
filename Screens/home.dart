import 'package:flutter/material.dart';
import 'package:foodapp/Scr/Helpers/screen_nav.dart';
import 'package:foodapp/Scr/Models/user.dart';
import 'package:foodapp/Scr/Providers/auth.dart';
import 'package:foodapp/Scr/Screens/cart.dart';
import 'package:foodapp/Scr/Screens/login.dart';
import 'package:foodapp/Scr/Widgets/botnav_icons.dart';
import 'package:foodapp/Scr/Widgets/categories.dart';
import 'package:foodapp/Scr/Helpers/constants.dart';
import 'package:foodapp/Scr/Widgets/customtext.dart';
import 'package:foodapp/Scr/Widgets/featured_products.dart';
import 'package:foodapp/Scr/Widgets/small_button.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        iconTheme: IconThemeData(color: black),
        elevation: 0.1,
        title: CustomText(text: 'Food App', size: 20 ,weight: FontWeight.w600,),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.shopping_cart), onPressed: () {}),
              Positioned(
                top: 12.0,
                right: 12.0,
                child: Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),

          Stack(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.notifications_none), onPressed: () {}),
              Positioned(
                top: 12.0,
                right: 12.0,
                child: Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: BoxDecoration(
                    color: pink,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: grey,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: pink),
              accountName: CustomText(
              text: 'WELCOME TO \nTHE FOOD APP', size: 25, weight: FontWeight.bold,),
             accountEmail: CustomText(text: authProvider.user.email, size: 20,)),
            ListTile(
              onTap: (){},
              leading: Icon(Icons.home),
              title: CustomText(text: 'Home'),
            ),

            ListTile(
              onTap: (){
                changeScreen(context, ShoppingCart());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: 'Item Cart'),
            ),

            ListTile(
              onTap: (){
                user.signOut();
                changeScreenReplace(context, LoginScreen());
              },
              leading: Icon(Icons.person),
              title: CustomText(text: 'Account'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 15.0),
                child: Container(
                  decoration: 
                  BoxDecoration(color: white,
                  borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.search, color: pink),
                    title: TextField(
                      decoration: InputDecoration(
                          hintText: 'Find Food and Restaurants',
                          border: InputBorder.none),
                    ),
                    trailing: Icon(Icons.filter_list, color: pink),
                  ),
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Categories(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: 'Featured', size: 20.0, colors: black),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(text: 'Popular', size: 20.0, colors: black),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('Images/Lasagna.jpg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SmallButton(Icons.favorite),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: 50.0,
                            decoration: BoxDecoration(
                                color: white,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Icon(Icons.star,
                                      color: Colors.yellow[900], size: 20.0),
                                ),
                                Text('4.5')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20)),
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.7),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.6),
                              Colors.black.withOpacity(0.4),
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.05),
                              Colors.black.withOpacity(0.025),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                      child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(12.0, 8.0, 8.0, 8.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: 'Lasagna \n',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: white)),
                            TextSpan(
                                text: 'by: ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                    color: white)),
                            TextSpan(
                                text: 'Greenwich',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: white)),
                          ], style: TextStyle(color: black))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: '\$5.99 \n',
                                style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w300,
                                    color: white))
                          ], style: TextStyle(color: black))),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
