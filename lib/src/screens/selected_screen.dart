import 'package:flutter/material.dart';

class SelectedPage extends StatefulWidget {
  final String description;

  const SelectedPage({Key? key, required this.description}) : super(key: key);
  @override
  _SelectedPageState createState() => _SelectedPageState();
}

class _SelectedPageState extends State<SelectedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Selected"),),
      body: Center(child: Text(widget.description),),
    );
  }
}
