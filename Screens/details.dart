import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/Scr/Models/products.dart';
import 'package:foodapp/Scr/Helpers/constants.dart';
import 'package:foodapp/Scr/Widgets/botnav_icons.dart';
import 'package:foodapp/Scr/Widgets/customtext.dart';
import 'package:foodapp/Scr/Widgets/small_button.dart';

class Details extends StatefulWidget {
  final Product product;

  Details({@required this.product});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 275,
              child: Stack(
                children: <Widget>[
                  Carousel(
                    images: [
                      AssetImage('Images/${widget.product.image}'),
                      AssetImage('Images/${widget.product.image}'),
                      AssetImage('Images/${widget.product.image}')
                    ],
                    dotBgColor: white,
                    dotColor: grey,
                    dotIncreasedColor: pink,
                    dotSize: 5.0,
                    autoplay: false,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: pink,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Stack(
                          children: <Widget>[
                            Image.asset(
                              'Images/cart.png',
                              width: 30,
                              height: 30,
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
                                  padding: const EdgeInsets.only(
                                      left: 4.0, right: 4.0),
                                  child: CustomText(
                                    text: "2",
                                    colors: pink,
                                    size: 12,
                                    weight: FontWeight.bold,
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 14,
                    bottom: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: grey,
                              offset: Offset(2,3),
                              blurRadius: 3
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Icon(
                            Icons.favorite,
                            size: 22,
                            color: pink,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            CustomText(text: widget.product.name, size: 24, weight: FontWeight.bold,),
            CustomText(text: '\$' + widget.product.price.toString(), size: 20, weight: FontWeight.w600, colors: pink,),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.remove, size: 30,), onPressed: (){}),
                ),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    decoration: BoxDecoration(
                      color: pink
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22.0, 8.0, 22.0, 8.0),
                      child: CustomText(text: 'Add To Cart', colors: white, size: 20, weight: FontWeight.w600,),
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(icon: Icon(Icons.add, size: 30, color: pink),
                   onPressed: (){}),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
