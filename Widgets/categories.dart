import 'package:flutter/material.dart';
import 'package:foodapp/Scr/Models/category.dart';
import 'package:foodapp/Scr/Widgets/customtext.dart';
import 'package:foodapp/Scr/Helpers/constants.dart';

List<Category> categoriesList = [
  Category(name: 'Lasagna', image: 'Lasagna.jpg'),
  Category(name: 'Pasta', image: 'Pasta.jpg'),
  Category(name: 'Pizza', image: 'Pizza.jpg'),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
              height: 95.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (_, index){
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(color: white, boxShadow: [
                    BoxShadow(color: white, offset: Offset(4, 6), blurRadius: 20)
                      ]),
                      child: Padding(padding: EdgeInsets.all(4),
                      child: Image.asset(
                        'Images/${categoriesList[index].image}',
                        width: 60,
                        height: 45
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    CustomText(text: categoriesList[index].name, size: 14.0,)
                  ],
                ),
              );
            },
          ),
    );
  }
}