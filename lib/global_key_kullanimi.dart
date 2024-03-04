import 'package:flutter/material.dart';
import 'package:flutter_inputs/sayac_widget.dart';

class GlobalKeyKullanimi extends StatelessWidget {
  GlobalKeyKullanimi({super.key});
  final _sayacKey = GlobalKey<sayacWidgetState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Key Kullanimi'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Button'a Basilma Miktari",
              style: TextStyle(fontSize: 25),
            ),
            sayacWidget(
              key: _sayacKey,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _sayacKey.currentState!.arttir();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}