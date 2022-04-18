import 'package:flutter/material.dart';
import 'package:pageview_carrousel/components/text_form_widget.dart';
import 'package:pageview_carrousel/controller/cep_provider.dart';
import 'package:pageview_carrousel/utils/validate_cep.dart';
import 'package:provider/provider.dart';

class CepPage extends StatefulWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  _CepPageState createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  TextEditingController cepController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController localController = TextEditingController();
  TextEditingController numController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    CepProvider provider = Provider.of<CepProvider>(context);

    void clearCampos() {
      cepController.clear();
      bairroController.clear();
      endController.clear();
      localController.clear();
      numController.clear();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Cadastro',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: clearCampos,
            icon: const Icon(
              Icons.refresh,
              size: 25,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 50),
                TextFormWidget(
                  'Cep',
                  'digite p Cep',
                  controller: cepController,
                  validator: Validate().validarCep,
                  icon: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        provider.GetCep(cepController.text);
                        bairroController.text = provider.bairro.toString();
                        endController.text = provider.localidade.toString();
                        localController.text = provider.endereco.toString();
                      }
                    },
                    child: const Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Container(
                      width: 300,
                      child: TextFormWidget(
                        'Endereço',
                        'Digite o Endereco',
                        controller: localController,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: 130,
                      child: TextFormWidget(
                        'Numero',
                        'Numero',
                        controller: numController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextFormWidget(
                  'Bairro',
                  'Digite o Bairro',
                  controller: bairroController,
                ),
                SizedBox(height: 10),
                TextFormWidget(
                  'Localidade',
                  'Digite a localidade',
                  controller: endController,
                ),
                SizedBox(height: 20),
                buildInkWell()
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildInkWell() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 58,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: const Text(
          'Salvar',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}