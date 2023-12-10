import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: TextField(
          
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(16)
            ),
            prefixIcon: const Icon(Icons.search)
          ),
        )
      ),
      body: const Center(child: Text('empty')),
    );
  }
}
