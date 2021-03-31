import 'package:flutter/material.dart';
import 'package:foodapp/Scr/Helpers/constants.dart';
import 'package:foodapp/Scr/Models/products.dart';
import 'package:foodapp/Scr/Widgets/customtext.dart';

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  Product product = Product(
    name: 'Lasagna',
    price: 5.99,
    rating: 4.2,
    vendor: 'Greenwich',
    wishList: true,
    image: 'Lasagna.jpg',
    details:
        'A type of wide, flat pasta, possibly one of the oldest types of pasta. Lasagne, or the singular lasagna, is an Italian dish made of stacked layers of thin flat pasta alternating with fillings such as ragù and other vegetables, cheese, and seasonings and spices such as garlic, oregano and basil',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: CustomText(
            text: 'Shopping Cart',
            colors: black,
            size: 20,
            weight: FontWeight.bold),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 14.0, top: 13.0),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  'Images/cart.png',
                  width: 35,
                  height: 35,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: grey,
                          offset: Offset(2, 1),
                          blurRadius: 3,
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: CustomText(
                      text: "2",
                      colors: pink,
                      size: 14,
                      weight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: grey,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 120,
              width: MediaQuery.of(context).size.width - 10,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(color: pink, offset: Offset(1, 2), blurRadius: 5)
                ],
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'Images/${product.image}',
                      height: 140,
                      width: 120,
                    ),
                  ),
                  
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: product.name + '\n',
                                  style: TextStyle(color: black, fontSize: 20.0)),
                              TextSpan(
                                  text: '\$' + product.price.toString(),
                                  style: TextStyle(color: black, fontSize: 16.0))
                            ]),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(width: 100),
                  IconButton(icon: Icon(Icons.delete), onPressed: (){},),
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
