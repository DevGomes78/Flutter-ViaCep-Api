import 'package:flutter/material.dart';
import 'package:pageview_carrousel/provider/cep_provider.dart';
import 'package:provider/provider.dart';

Widget SearchBar(context) {
  TextEditingController txtCep = TextEditingController();
  final provider = Provider.of<CepProvider>(context);
  return Column(
    children: [
      Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xff99B6F1F3),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Digite o Cep',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 20),
                ),
                controller: txtCep,
              ),
            ),
            RaisedButton(
              onPressed: () {provider.GetCep(txtCep.text);},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Icon(Icons.search,color: Colors.white,),
              color: Colors.blueAccent,
            ),
          ],
        ),
      )
    ],
  );
}
