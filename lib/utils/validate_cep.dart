class Validate{
  String? validarCep(String? value) {
    if(value!.isEmpty){
      return'Campo Cep em Branco';
    }
  }
}