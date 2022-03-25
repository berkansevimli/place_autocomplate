import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  final text;
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    title: Text('Checkin 1/3',style: TextStyle(color: Colors.blue.shade300),),
    backgroundColor: Colors.white,
    elevation: 0,
    iconTheme: Theme.of(context).iconTheme,
    actions: [IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward,color: Colors.blue.shade300,))],
  );
}
