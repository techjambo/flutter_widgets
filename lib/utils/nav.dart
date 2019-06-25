import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page ) async{
return await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          return page;
        },
      ),
    );
}
