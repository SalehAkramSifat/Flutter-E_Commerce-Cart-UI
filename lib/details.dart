import 'package:android/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailsActivity extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String rating;

  DetailsActivity({
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"), backgroundColor: Colors.blue, centerTitle: true,),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.white24, blurRadius: 10, spreadRadius: 20, offset: Offset(0, 5))],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(image, width: double.infinity, height: 250, fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                boxShadow: [BoxShadow(color: Colors.blue, blurRadius: 200, offset: Offset(0, -5))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text(price, style: TextStyle(fontSize: 15, color: Colors.redAccent)),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange, size: 12),
                      Text(rating, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Cart", style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                      ),
                      SizedBox(width: 5),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text("Buy", style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

