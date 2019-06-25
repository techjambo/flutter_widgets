import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Hello Flutter",
          ),
          centerTitle: true,
        ),
        body: _body());
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          _text(),
          _imgFromAsset(),
          _button(),
        ],
      ),
    );
  }

  _row() {
    return Row(
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _rowWithAxisAlignStart() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _rowWithAxisAlignCenter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _rowWithAxisAlignEnd() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _column() {
    return Column(
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _columnWithAxisAlignStart() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _columnWithAxisAlignCenter() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _columnWithAxisAlignEnd() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _rowWithMinLength() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _columnWithMinLength() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
        _buttonWithoutCentralized(),
      ],
    );
  }

  _buttonWithoutCentralized() {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        "Save",
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => _onClickOk(),
    );
  }

  _button() {
    return Center(
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          "Save",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => _onClickOk(),
      ),
    );
  }

  _onClickOk() {
    print("Button pressed");
  }

  _imgFromNetwork() {
    return Center(
        child: Image.network(
      "https://i.pinimg.com/564x/a0/6a/ef/a06aef0b21e9cf8e1017107884d688fd.jpg",
    ));
  }

  _imgFromAsset() {
    return Center(
      child: Image.asset("assets/images/dog1.png"),
    );
  }

  _imgExpandedFromAsset() {
    return SizedBox.expand(
      child: Image.asset(
        "assets/images/dog1.png",
        fit: BoxFit.cover,
      ),
    );
  }

  _imagesFromAssetsListView() {
    return ListView(
      children: <Widget>[
        _imgFromAsset(),
        _imgFromAsset(),
        _imgFromAsset(),
      ],
    );
  }

  _text() {
    return Text(
      "Hello World",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
