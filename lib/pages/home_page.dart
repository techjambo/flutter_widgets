import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/hello_listview.dart';
import 'package:flutter_widgets/pages/hello_page1.dart';
import 'package:flutter_widgets/pages/hello_page2.dart';
import 'package:flutter_widgets/pages/hello_page3.dart';
import 'package:flutter_widgets/utils/nav.dart';


import 'package:fluttertoast/fluttertoast.dart';

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
      body: _bodyWithContext(context),
    );
  }

  _bodyExpanded() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: _pageView(),
            flex: 6,
          ),
          Expanded(
            child: _pageView(),
            flex: 4,
          ),
        ],
      ),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  _bodyWithContext(context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttonsWithContextBuilderFunction(),
        ],
      ),
    );
  }

  _bodyWithPadding() {
    return Container(
      padding: EdgeInsets.all(8.0),
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  _bodyWithSingleChildScrollView() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(8.0),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _text(),
            _pageView(),
            _buttons(),
            _text(),
            _pageView(),
            _buttons(),
          ],
        ),
      ),
    );
  }

  _pageView() {
    return Container(
      height: 300,
      child: PageView(
        children: <Widget>[
          _imgFromAssetWithParameter("assets/images/dog1.png"),
          _imgFromAssetWithParameter("assets/images/dog2.png"),
          _imgFromAssetWithParameter("assets/images/dog3.png"),
          _imgFromAssetWithParameter("assets/images/dog4.png"),
          _imgFromAssetWithParameter("assets/images/dog5.png"),
        ],
      ),
    );
  }

  _buttons() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buttonWithParameterText("ListView"),
            _buttonWithParameterText("Page 2"),
            _buttonWithParameterText("Page 3"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buttonWithParameterText("Snack"),
            _buttonWithParameterText("Dialog"),
            _buttonWithParameterText("Toast"),
          ],
        ),
      ],
    );
  }

  _buttonsWithContext(context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buttonWithParameterTextWithContext(context, "ListView"),
            _buttonWithParameterTextWithContext(context, "Page 2"),
            _buttonWithParameterTextWithContext(context, "Page 3"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buttonWithParameterTextWithContext(context, "Snack"),
            _buttonWithParameterTextWithContext(context, "Dialog"),
            _buttonWithParameterTextWithContext(context, "Toast"),
          ],
        ),
      ],
    );
  }

  _buttonsWithContextFunction(context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buttonWithParameterTextWithContextFunction(context, "ListView",
                () => _onClickNavigator(context, HelloListView())),
            _buttonWithParameterTextWithContextFunction(context, "Page 2",
                () => _onClickNavigator(context, HelloPage2())),
            _buttonWithParameterTextWithContextFunction(context, "Page 3",
                () => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buttonWithParameterTextWithContextFunction(
                context, "Snack", _onClickSnack()),
            _buttonWithParameterTextWithContextFunction(
                context, "Dialog", _onClickDialog()),
            _buttonWithParameterTextWithContextFunction(
                context, "Toast", _onClickToast()),
          ],
        ),
      ],
    );
  }

  _buttonsWithContextBuilderFunction() {
    return Builder(
      builder: (context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buttonWithParameterTextWithContextFunction(context, "ListView",
                    () => _onClickNavigator(context, HelloListView())),
                _buttonWithParameterTextWithContextFunction(context, "Page 2",
                    () => _onClickNavigator(context, HelloPage2())),
                _buttonWithParameterTextWithContextFunction(context, "Page 3",
                    () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buttonWithParameterTextWithContextFunction(
                    context, "Snack", () => _onClickSnackContext(context)),
                _buttonWithParameterTextWithContextFunction(
                    context, "Dialog", () => _onClickDialogContext(context)),
                _buttonWithParameterTextWithContextFunction(
                    context, "Toast", () => _onClickToast()),
              ],
            ),
          ],
        );
      },
    );
  }

  _onClickNavigator(context, Widget page) async {
    print("Button with context pressed");
    String valueReturned = await push(context, page);

    print(" Value returnet $valueReturned");
  }

  _onClickSnack() {}
  _onClickSnackContext(context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(
          "Hello Snack Flutter",
        ),
        action: SnackBarAction(
          textColor: Colors.yellow,
          label: "Ok",
          onPressed: () {
            print("Ok");
          },
        ),
      ),
    );
  }

  _onClickDialog() {}

  _onClickDialogContext(BuildContext context) {
    showDialog(
        barrierDismissible: false, //dont close dialog when click outside
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Hello Dialog Flutter"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                    print("Ok pressed");
                  },
                ),
              ],
            ),
          );
        });
  }

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
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

  _buttonWithParameterText(String text) {
    return Center(
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => _onClickOk(),
      ),
    );
  }

  _buttonWithParameterTextWithContext(context, String text) {
    return Center(
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => _onClickOkWithContext(context),
      ),
    );
  }

  _buttonWithParameterTextWithContextFunction(
      context, String text, Function onPressed) {
    return Center(
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => onPressed(),
      ),
    );
  }

  _onClickOk() {
    print("Button pressed");
  }

  _onClickOkWithContext(context) {
    print("Button with context pressed");
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return HelloPage1();
        },
      ),
    );
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

  _imgFromAssetWithParameter(String img) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Image.asset(img, fit: BoxFit.cover),
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
