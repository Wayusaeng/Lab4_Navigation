import 'package:flutter/material.dart';

class Product {
  final String name;
  final double price;

  Product(this.name, this.price);
}

void main() => runApp(const MaterialApp(home: ListPage()));

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product('สินค้า A', 150.0),
      Product('สินค้า B', 299.0),
      Product('สินค้า C', 990.0),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('รายการสินค้า')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, i) => ListTile(
          title: Text(products[i].name),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(product: products[i]),
            ),
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Product product;
  const DetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(product.name)),
        body: Center(
          child: Text(
            '฿${product.price}',
            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      );
}