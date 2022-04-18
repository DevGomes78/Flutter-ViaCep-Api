class Validate{
  String? validarCep(String? value) {
    if(value!.isEmpty){
      return'campo Cep em Branco';
    }
  }
}