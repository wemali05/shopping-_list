import 'package:flutter/material.dart';
// import 'package:shopping_list/data/dummy_items.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _gorceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      _gorceryItems.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No Item added yet'));

    if(_gorceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _gorceryItems.length,
        itemBuilder: (ctx, index) => ListTile(
          title: Text(_gorceryItems[index].name),
          leading: Container(
            height: 24,
            width: 24,
            color: _gorceryItems[index].category.color,
          ),
          trailing: Text(
            _gorceryItems[index].quantity.toString(),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
