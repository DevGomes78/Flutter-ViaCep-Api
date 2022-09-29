import 'package:flutter/material.dart';
import 'package:pageview_carrousel/components/container_widget.dart';
import 'package:pageview_carrousel/components/text_form_widget.dart';
import 'package:pageview_carrousel/components/text_widget.dart';
import 'package:pageview_carrousel/controller/cep_provider.dart';
import 'package:pageview_carrousel/utils/validate_cep.dart';
import 'package:provider/provider.dart';

import '../string_constants/string_constants.dart';

class CepPage extends StatefulWidget {
  const CepPage({Key? key}) : super(key: key);

  @override
  _CepPageState createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {

  TextEditingController nameController = TextEditingController();
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
      appBar: buildAppBar(clearCampos),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
            key: _formKey,
            child: Consumer<CepProvider>(builder: (context, provider, child) {
              return Column(
                children: [
                  SizedBox(height: 20),
                    _areaNome(),
                  SizedBox(height: 10),
                  _areaPhone(),
                  SizedBox(height: 10),
                  _areaCep(_formKey, provider),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _areaEndereco(),
                      SizedBox(width: 5),
                      _areaNumero(),
                    ],
                  ),
                  SizedBox(height: 10),
                  _areaBairro(),
                  SizedBox(height: 10),
                  _areaLocalidade(),
                  SizedBox(height: 20),
                  _btnSalvar(),
                  SizedBox(height: 20),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(void clearCampos()) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      title: const Text(
        StringConstants.register,
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
    );
  }

  _areaNome() {
    return ContainerWidget(
      Alignment.center,
      55,
      double.infinity,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.name,
        StringConstants.lastname,
        controller: nameController,
      ),
    );
  }
  _areaPhone() {
    return ContainerWidget(
      Alignment.center,
      55,
      double.infinity,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.phone,
        StringConstants.enterPhone,
        controller: phoneController,
      ),
    );
  }
  _areaCep(GlobalKey<FormState> _formKey, CepProvider provider) {
    return ContainerWidget(
      Alignment.center,
      55,
      double.infinity,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.cep,
        StringConstants.enterCep,
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
    );
  }

  _areaEndereco() {
    return ContainerWidget(
      Alignment.center,
      55,
      200,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.adress,
        StringConstants.enterAdress,
        controller: localController,
      ),
    );
  }

  _areaNumero() {
    return ContainerWidget(
      Alignment.center,
      55,
      90,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.number,
        StringConstants.enterNumber,
        controller: numController,
      ),
    );
  }

  _areaBairro() {
    return ContainerWidget(
      Alignment.center,
      55,
      double.infinity,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.district,
        StringConstants.enterDistrict,
        controller: bairroController,
      ),
    );
  }

  _areaLocalidade() {
    return ContainerWidget(
      Alignment.center,
      55,
      double.infinity,
      color: Colors.grey[200],
      child: TextFormWidget(
        StringConstants.locality,
        StringConstants.enterLocality,
        controller: endController,
      ),
    );
  }

  _btnSalvar() {
    return InkWell(
      onTap: () {},
      child: ContainerWidget(
        Alignment.center,
        55,
        double.infinity,
        color: Colors.deepPurple,
        child: Text(
          StringConstants.save,
          style: AppTextStyle.MainText,
        ),
      ),
    );
  }
}
