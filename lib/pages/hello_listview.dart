import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widgets/pages/dog_page.dart';
import 'package:flutter_widgets/utils/nav.dart';

class Dog {
  String name;
  String photoPath;

  Dog(this.name, this.photoPath);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello ListView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _gridView = false;
              });

              print("List");
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                _gridView = true;
              });

              print("Grid");
            },
          )
        ],
      ),
      body: _bodyWithGridView(),
    );
  }

  _body() {
    return ListView(
      itemExtent: 350,
      children: <Widget>[
        _imgFromAssetWithParameter("assets/images/dog1.png"),
        _imgFromAssetWithParameter("assets/images/dog2.png"),
        _imgFromAssetWithParameter("assets/images/dog3.png"),
        _imgFromAssetWithParameter("assets/images/dog4.png"),
        _imgFromAssetWithParameter("assets/images/dog5.png"),
      ],
    );
  }

  _bodyWithImageArray() {
    List<Image> imgs = [
      _imgFromAssetWithParameter("assets/images/dog1.png"),
      _imgFromAssetWithParameter("assets/images/dog2.png"),
      _imgFromAssetWithParameter("assets/images/dog3.png"),
      _imgFromAssetWithParameter("assets/images/dog4.png"),
      _imgFromAssetWithParameter("assets/images/dog5.png")
    ];
    return ListView(
      itemExtent: 350,
      children: imgs,
    );
  }

  _bodyWithListViewBuilder() {
    List<Image> imgs = [
      _imgFromAssetWithParameter("assets/images/dog1.png"),
      _imgFromAssetWithParameter("assets/images/dog2.png"),
      _imgFromAssetWithParameter("assets/images/dog3.png"),
      _imgFromAssetWithParameter("assets/images/dog4.png"),
      _imgFromAssetWithParameter("assets/images/dog5.png")
    ];
    return ListView.builder(
      itemCount: imgs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        Image img = imgs[index];
        return img;
      },
    );
  }

  _bodyWithDogClass() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiller", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png")
    ];
    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        Dog dog = dogs[index];
        return _img(dog.photoPath);
      },
    );
  }

  _bodyWithStack() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiller", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png")
    ];
    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        Dog dog = dogs[index];
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(dog.photoPath),
            Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                dog.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        );
      },
    );
  }

  _bodyWithDecoration() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiller", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png")
    ];
    return ListView.builder(
      itemCount: dogs.length,
      itemExtent: 350,
      itemBuilder: (context, index) {
        Dog dog = dogs[index];
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _img(dog.photoPath),
            Container(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    dog.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
          ],
        );
      },
    );
  }

  _bodyWithGridView() {
    List<Dog> dogs = [
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiller", "assets/images/dog4.png"),
      Dog("Pastor", "assets/images/dog5.png"),
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiller", "assets/images/dog4.png"),
      Dog("Jack Russel", "assets/images/dog1.png"),
      Dog("Labrador", "assets/images/dog2.png"),
      Dog("Pug", "assets/images/dog3.png"),
      Dog("Rotweiller", "assets/images/dog4.png")
    ];

    if (_gridView) {
      return GridView.builder(
        itemCount: dogs.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 350,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];
    return GestureDetector(
      onTap: (){
        push(context, DogPage(dog));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _img(dog.photoPath),
          Container(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  dog.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      fit: BoxFit.cover,
    );
  }

  _imgFromAssetWithParameter(String img) {
    return Container(
      child: Image.asset(
        img,
        fit: BoxFit.cover,
      ),
    );
  }
}
