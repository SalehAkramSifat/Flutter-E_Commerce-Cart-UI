import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Center(
        child: Text('Cart is Empty'),
      ),
    );
  }
}
