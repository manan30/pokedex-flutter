import 'package:flutter/material.dart';

class PokemonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PokemonList'),
      ),
      body: ListView.builder(
        padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
        itemCount: 20,
        itemBuilder: (context, index) => _PokemonCard(),
      ),
    );
  }

  Widget _PokemonCard() {
    return Card(
      elevation: 1.6,
      child: Container(
        height: 96,
        child: Text(''),
      ),
    );
  }
}
