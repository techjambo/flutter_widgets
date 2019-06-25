import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HelloPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Page 1"),
      ),
      body: _body(context),
    );
  }

  _body(context) {
    return Center(
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          "Back",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => _onPressed(context),
      ),
    );
  }

  _onPressed(context) {
    Navigator.pop(context,"Tela 1");
  }
}
