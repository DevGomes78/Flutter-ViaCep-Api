class Contact {

  final String contactTable = "contactTable";
  final String idColumn = "idColumn";
  final String nameColumn = "nameColumn";
  final String emailColumn = "emailColumn";
  final String phoneColumn = "phoneColumn";
  final String imgColumn = "imgColumn";

  int? id;
  String? name;
  String? email;
  String? phone;
  String? img;

  Contact();

  Contact.fromMap(Map map){
    id = map[idColumn];
    name = map[nameColumn];
    email = map[emailColumn];
    phone = map[phoneColumn];
    img = map[imgColumn];
  }

  Map<String,dynamic> toMap() {
    Map<String, dynamic> map = {
      nameColumn: name,
      emailColumn: email,
      phoneColumn: phone,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

}