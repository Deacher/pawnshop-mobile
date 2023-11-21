import 'package:flutter/material.dart';
import 'package:pawnshop/models/products.dart';

class DetailsPage extends StatelessWidget {
  final Product item;

  DetailsPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details Page',
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${item.fields.name}",
              style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(item.fields.description),
            const SizedBox(height: 5),
            Text("Amount: ${item.fields.amount}"),
            const SizedBox(height: 5),
            Text("Power: ${item.fields.power}"),
            const SizedBox(height: 5),
            Text("Mana: ${item.fields.mana}"),
            const SizedBox(height: 5),
            Text("Categories: ${item.fields.categories}"),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
