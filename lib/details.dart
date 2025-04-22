import 'package:flutter/material.dart';

class DetailsActivity extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final Function(Map<String, dynamic>) addToCart; // Cart-এ Add করার ফাংশন

  DetailsActivity({required this.image, required this.title, required this.price, required this.addToCart, required String rating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(image, width: 200, height: 200),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          Text(price, style: TextStyle(fontSize: 18, color: Colors.redAccent)),
          SizedBox(height: 20),

          // **Cart Button**
          ElevatedButton(
            onPressed: () {
              Map<String, dynamic> product = {
                "image": image,
                "title": title,
                "price": price,
              };
              addToCart(product);
              Navigator.pop(context); 
            },
            child: Text("Add to Cart"),
          ),

          // **Buy Button**
          ElevatedButton(
            onPressed: () {
              
            },
            child: Text("Buy Now"),
          ),
        ],
      ),
    );
  }
}
