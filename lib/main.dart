import 'package:flutter/material.dart';
import 'package:pageview_carrousel/provider/cep_provider.dart';
import 'package:pageview_carrousel/routes/app_routes.dart';
import 'package:pageview_carrousel/screens/busca_cep.dart';
import 'package:pageview_carrousel/screens/home.dart';
import 'package:provider/provider.dart';

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
       routes: {

         AppRoutes.HOME:(context) => HomePage(),
         AppRoutes.BUSCACEP:(context) => BuscaCep(),

       },
      ),
    );
  }
}

