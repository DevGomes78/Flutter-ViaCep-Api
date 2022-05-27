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
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
        backgroundColor: Colors.grey[100],
        elevation: 1,
        title: const Text(
          'Consulta Cep',
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
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30),
                  ContainerWidget(
                    55,
                    400,
                    color: Colors.grey[100],
                    child: TextFormWidget(
                      'Nome',
                      'Digite o Nome',
                      controller: nameController,
                    ),
                  ),
                  SizedBox(height: 10),
                  ContainerWidget(
                    55,
                    400,
                    color: Colors.grey[100],
                    child: TextFormWidget(
                      'Email',
                      'Digite o Email',
                      controller: emailController,
                    ),
                  ),
                  SizedBox(height: 10),
                  ContainerWidget(
                    55,
                    400,
                    color: Colors.grey[100],
                    child: TextFormWidget(
                      'Telefone',
                      'Digite o telefone',
                      controller: phoneController,
                    ),
                  ),
                  SizedBox(height: 10),
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
                    color: Colors.purple,
                  ),
                ),
              ),
              SizedBox(height: 10),
                  Row(
                    children: [
                      ContainerWidget(
                        55,
                        300,
                        color: Colors.grey[100],
                        child: TextFormWidget(
                          'Endereço',
                          'Digite o Endereco',
                          controller: localController,
                        ),
                      ),
                      SizedBox(width: 5),
                      ContainerWidget(
                        55,
                        85,
                        color: Colors.grey[100],
                        child: TextFormWidget(
                          'Num',
                          'Numero',
                          controller: numController,
                        ),
                      ),
                    ],
                  ),

              SizedBox(height: 10),
              ContainerWidget(

                55,
                double.infinity,
                color: Colors.grey[100],
                child: TextFormWidget(
                  'Bairro',
                  'Digite o Bairro',
                  controller: bairroController,
                ),
              ),
              SizedBox(height: 10),
              ContainerWidget(
                55,
                double.infinity,
                color: Colors.grey[100],
                child: TextFormWidget(
                  'Localidade',
                  'Digite a localidade',
                  controller: endController,
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: () {},
                child: ContainerWidget(

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
          ),
        );
      }),
    );
  }
}
