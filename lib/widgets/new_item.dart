import 'package:flutter/material.dart';

class NewItem extends StatelessWidget {
  const NewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: const Text('Form goes here'),
      ),
    );
  }
}