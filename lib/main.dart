import 'package:android/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cart.dart';
import 'details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeActivity(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeActivity extends StatefulWidget {
  @override
  _HomeActivityState createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartPage()),
      );


    } else if (index == 0) {
      Navigator.popUntil(context, ModalRoute.withName('/'));
    }else if (index ==2) {
      Navigator.push(context, MaterialPageRoute(builder:(context) =>Profile()));
    }
  }

  final List<Map<String, dynamic>> product = [
    {"image": "assets/apple.jpg", "title": "Apple iPhone 13", "price": "৳999", "rating": 4.5},
    {"image": "assets/apple.jpg", "title": "Apple iPhone 13", "price": "৳999", "rating": 4.5},
    {"image": "assets/apple.jpg", "title": "Apple iPhone 13", "price": "৳999", "rating": 4.5},
    {"image": "assets/apple.jpg", "title": "Apple iPhone 13", "price": "৳999", "rating": 4.5},
    {"image": "assets/apple.jpg", "title": "Apple iPhone 13", "price": "৳999", "rating": 4.5},
    {"image": "assets/apple.jpg", "title": "Apple iPhone 13", "price": "৳999", "rating": 4.5},
    {"image": "assets/apple.jpg", "title": "Apple iPhone 13", "price": "৳999", "rating": 4.5},
    {"image": "assets/apple.jpg", "title": "Apple iPhone 13", "price": "৳999", "rating": 4.5},
    {"image": "assets/apple.jpg", "title": "Apple iPhone 13", "price": "৳999", "rating": 4.5},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Product List",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.cart_fill, color: Colors.white),
            onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()));},
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.7,
                ),
                itemCount: product.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsActivity(
                            image: product[index]["image"]!,
                            title: product[index]["title"]!,
                            price: product[index]["price"]!,
                            rating: product[index]["rating"].toString(),
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                product[index]["image"]!,
                                fit: BoxFit.cover,
                                width: 150,
                                height: 100,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product[index]["title"],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  product[index]["price"],
                                  style: TextStyle(color: Colors.redAccent),
                                ),
                                SizedBox(height: 2),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 15,
                                      color: Colors.orange,
                                    ),
                                    Text(product[index]["rating"].toString())
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
