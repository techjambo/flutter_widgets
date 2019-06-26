import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'hello_listview.dart';

class DogPage extends StatelessWidget {
  Dog dog;

  DogPage(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dog Detail"),
      ),
      body: Image.asset(dog.photoPath),
    );
  }
}
