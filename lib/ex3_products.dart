import 'package:flutter/material.dart';

// EX 3 – The products (handout page: EX 3)
// Part 1: build ONE product card (images are in assets/ex3/).
// Part 2: create the Product enum (follow the UML in the handout).
// Part 3: extract the card into a StatelessWidget called ProductCard.

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Products')),
        body: Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (final product in Product.values)
                  ProductCard(product: product),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

enum Product {
  dart(
    title: 'Dart',
    description: 'the best object language',
    image: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile widget library',
    image: 'assets/ex3/flutter.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best cloud database',
    image: 'assets/ex3/firebase.png',
  );

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(product.image, width: 100, height: 100),
            const SizedBox(height: 5),
            Text(product.title, style: const TextStyle(fontSize: 30)),
            const SizedBox(height: 5),
            Text(product.description, style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}