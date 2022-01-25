import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:pageview_carrousel/models/cep.dart';


class CepProvider with ChangeNotifier {
  ValidaCep _cep = ValidaCep();

  String _endereco = '';
  String _bairro = '';
  String _localidade = '';

  String get endereco => _endereco;

  String get bairro => _bairro;

  String get localidade => _localidade;

  ValidaCep get cep => _cep;

  void GetCep(String cep) async {
    try {
      var url = Uri.parse('https://viacep.com.br/ws/${cep}/json/');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> retorno = jsonDecode(response.body);
        _endereco = retorno['logradouro'];
        _bairro = retorno['bairro'];
        _localidade = retorno['localidade'];
      } else {
        throw Exception('erro ao acessar a pagina');
      }
      notifyListeners();
    } catch (e) {
      throw Exception('erro ao acessar a pagina');
    }
  }
}