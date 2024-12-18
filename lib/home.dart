import 'package:flutter/material.dart';
import 'menu_darwer.dart';
import 'form.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PT Peminjaman Farhan'),
      ),
      drawer: MenuDrawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoanFormScreen()),
            );
          },
          child: Text('Buat Peminjaman Anda...'),
        ),
      ),
    );
  }
}
