import 'package:flutter/material.dart';
import 'package:pageview_carrousel/components/container_widget.dart';
import 'package:pageview_carrousel/components/text_form_widget.dart';
import 'package:pageview_carrousel/components/text_widget.dart';
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

    void clearCampos() {
      cepController.clear();
      bairroController.clear();
      endController.clear();
      localController.clear();
      numController.clear();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Cadastro',
          style: TextStyle(color: Colors.deepPurple),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: clearCampos,
            icon: const Icon(
              Icons.refresh,
              size: 25,
              color: Colors.deepPurple,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: buildForm(_formKey),
        ),
      ),
    );
  }

  Form buildForm(GlobalKey<FormState> _formKey) {
    return Form(
      key: _formKey,
      child: Consumer<CepProvider>(builder: (
        context,
        provider,
        child,
      ) {
        return Column(
          children: [
            SizedBox(height: 30),
            ButtonWidget(
              Alignment.center,
              55,
              double.infinity,
              color: Colors.grey[200],
              child: TextFormWidget(
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
                    color: Colors.purple,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ButtonWidget(
                  Alignment.center,
                  55,
                  300,
                  color: Colors.grey[200],
                  child: TextFormWidget(
                    'Endereço',
                    'Digite o Endereco',
                    controller: localController,
                  ),
                ),
                SizedBox(width: 5),
                ButtonWidget(
                  Alignment.center,
                  55,
                  85,
                  color: Colors.grey[200],
                  child: TextFormWidget(
                    'Num',
                    'Numero',
                    controller: numController,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            ButtonWidget(
              Alignment.center,
              55,
              double.infinity,
              color: Colors.grey[200],
              child: TextFormWidget(
                'Bairro',
                'Digite o Bairro',
                controller: bairroController,
              ),
            ),
            SizedBox(height: 10),
            ButtonWidget(
              Alignment.center,
              55,
              double.infinity,
              color: Colors.grey[200],
              child: TextFormWidget(
                'Localidade',
                'Digite a localidade',
                controller: endController,
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: ButtonWidget(
                Alignment.center,
                55,
                double.infinity,
                color: Colors.deepPurple,
                child: Text(
                  'Salvar',
                  style: AppTextStyle.MainText,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
