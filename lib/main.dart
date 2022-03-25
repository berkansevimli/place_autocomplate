import 'package:flutter/material.dart';
import 'package:place_autocomplete/src/blocs/application_bloc.dart';
import 'package:place_autocomplete/src/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
          child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
