import 'package:flutter/material.dart';
import 'package:goodang/models/item.dart';
import 'package:goodang/widgets/left_drawer.dart';

class DetailItemPage extends StatefulWidget {
    final Item item;

    const DetailItemPage({super.key, required this.item});

    @override
    State<DetailItemPage> createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Center(
              child: Text(
                'Detail Item',
              ),
            ),
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
      drawer: const LeftDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Item Name:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.item.fields.itemName,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Owner: ${widget.item.fields.owner}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Category: ${widget.item.fields.category}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Amount: ${widget.item.fields.amount}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Price: ${widget.item.fields.price}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Description: ${widget.item.fields.description}',
              style: const TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigasi kembali ketika tombol ditekan
                Navigator.pop(context);
              },
              child: const Text('Kembali'),
            ),            
          ],
        ),
      ),
    );
  }
}