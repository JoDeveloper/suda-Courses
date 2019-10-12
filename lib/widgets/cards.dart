import 'package:flutter/material.dart';
import 'network_image.dart';

Widget cards(image, title, price) {
  return Container(
    height: 200,
    width: 200,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 6.0,
        ),
      ],
      color: Colors.white,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image,height: 80),
          SizedBox(
            height: 5,
          ),
          Text(title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.only(top: 4),
              color: Colors.deepOrange,
              child: Text("\$ " + price,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12))),
        ],
      ),
    ),
  );
}
