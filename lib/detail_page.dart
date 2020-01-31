import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget { 
  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Page"),
      ),
      body: Container(
        child: Center(
          child: Text("This is where the detail page will go.")
          ),
      ),
    );
  }
}