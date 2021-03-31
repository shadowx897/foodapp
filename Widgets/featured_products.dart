import 'package:flutter/material.dart';
import 'package:foodapp/Scr/Helpers/screen_nav.dart';
import 'package:foodapp/Scr/Models/products.dart';
import 'package:foodapp/Scr/Helpers/constants.dart';
import 'package:foodapp/Scr/Screens/details.dart';
import 'package:foodapp/Scr/Widgets/customtext.dart';

List<Product> productsList = [
  Product(
      name: 'Lasagna',
      price: 5.99,
      rating: 4.2,
      vendor: 'Greenwich',
      wishList: true,
      image: 'Lasagna.jpg',
      details: 'A type of wide, flat pasta, possibly one of the oldest types of pasta. Lasagne, or the singular lasagna, is an Italian dish made of stacked layers of thin flat pasta alternating with fillings such as ragù and other vegetables, cheese, and seasonings and spices such as garlic, oregano and basil',
      ),
  Product(
      name: 'Pizza',
      price: 12.99,
      rating: 3.8,
      vendor: 'Greenwich',
      wishList: false,
      image: 'Pizza.jpg'
      ),
  Product(
      name: 'Pasta',
      price: 8.99,
      rating: 2.4,
      vendor: 'Greenwich',
      wishList: false,
      image: 'Pasta.jpg'
      ),
];

class Featured extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                changeScreen(_, Details(product: productsList[index],));
              },
              child: Container(
                height: 240.0,
                width: 200.0,
                decoration: BoxDecoration(
                  color: white,
                  boxShadow: [
                    BoxShadow(
                        color: black2, offset: Offset(15, 5), blurRadius: 30)
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'Images/${productsList[index].image}',
                      height: 140,
                      width: 140,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CustomText(
                            text: productsList[index].name,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                      color: grey,
                                      offset: Offset(1, 1),
                                      blurRadius: 4)
                                ],
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: productsList[index].wishList
                                    ? Icon(
                                        Icons.favorite,
                                        size: 18,
                                        color: pink,
                                      )
                                    : Icon(
                                        Icons.favorite_border,
                                        size: 18,
                                        color: pink,
                                      )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CustomText(
                                text: productsList[index].rating.toString(),
                                colors: grey,
                                size: 14,
                              ),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Icon(
                              Icons.star,
                              color: pink,
                              size: 16,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: CustomText(
                            text: '\$${productsList[index].price}',
                            weight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
