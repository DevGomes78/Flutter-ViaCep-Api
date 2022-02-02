import 'package:flutter/material.dart';
import 'package:pageview_carrousel/provider/cep_provider.dart';
import 'package:provider/provider.dart';

import 'components/seachbar.dart';

class BuscaCep extends StatelessWidget {
  const BuscaCep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CepProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Busca Cep',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              //Widget SearchBar
              SearchBar(context),
              SizedBox(
                height: 50,
              ),
              Text(
                'Endereço',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 40,
                width: 365,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffBFCEECFF),
                ),
                alignment: Alignment.center,
                child: Text(
                  provider.endereco.toString(),
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 157,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffBFCEECFF),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      provider.bairro.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 40,
                      width: 198,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffBFCEECFF)),
                      alignment: Alignment.center,
                      child: Text(
                        provider.localidade.toString(),
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
