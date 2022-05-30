import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pageview_carrousel/components/text_form_widget.dart';
import 'package:pageview_carrousel/models/contact_models.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;

  ContactPage({this.contact});

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();

  bool _userEdited = false;

  Contact? _editedContact;

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact!.toMap());
      _nameController.text = _editedContact!.name!;
      _emailController.text = _editedContact!.email!;
      _phoneController.text = _editedContact!.phone!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.blue,
          title: Text(
            _editedContact!.name ?? "Novo Contato",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 150),
              _editNome(),
              SizedBox(height: 10),
              _editiEmail(),
              SizedBox(height: 10),
              _editTelefone(),
              SizedBox(height: 30),
              btnSave(),
            ],
          ),
        ),
      ),
    );
  }

  btnSave() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          if (_editedContact!.name != null &&
              _editedContact!.name!.isNotEmpty) {
            Navigator.pop(context, _editedContact);
          } else {
            FocusScope.of(context).requestFocus(_nameFocus);
          }
        },
        child: Container(
          alignment: Alignment.center,
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
           color: Colors.blue,
          ),
          child: Text(
            'Salvar',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _editTelefone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormWidget(
        "Phone",
        'Digite o Telefone',
        icon: Icon(Icons.phone, color: Colors.blue),
        controller: _phoneController,
        onChanged: (text) {
          _userEdited = true;
          _editedContact!.phone = text;
        },
      ),
    );
  }

  _editiEmail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormWidget(
        "Email",
        'digite o email',
        icon: Icon(Icons.email, color: Colors.blue),
        controller: _emailController,
        onChanged: (text) {
          _userEdited = true;
          _editedContact!.email = text;
        },
      ),
    );
  }

  _editNome() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFormWidget(
        "Nome",
        'digite  o nome',
        icon: Icon(Icons.people, color: Colors.blue),
        controller: _nameController,
        onChanged: (text) {
          _userEdited = true;
          setState(() {
            _editedContact!.name = text;
          });
        },
      ),
    );
  }

  Future<bool> _requestPop() {
    if (_userEdited) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Descartar Alterações?"),
              content: Text("Se sair as alterações serão perdidas."),
              actions: [
                FlatButton(
                  child: Text("Cancelar"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Sim"),
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }
}
