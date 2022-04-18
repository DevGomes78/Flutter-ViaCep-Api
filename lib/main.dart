import 'package:flutter/material.dart';
import 'package:pageview_carrousel/views/home_page.dart';
import 'package:provider/provider.dart';

import 'controller/cep_provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context)=> CepProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),

    );
  }
}

