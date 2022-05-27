

import 'package:pageview_carrousel/constants/service_constants.dart';

class Contact {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? street;
  String? number;
  String? complement;
  String? city;
  String? state;

  Contact();

  Contact.fromMap(Map map) {
    id = map[UserColumn().idColumn];
    name = map[UserColumn().nameColumn];
    email = map[UserColumn().emailColumn];
    phone = map[UserColumn().phoneColumn];
   street = map[UserColumn().streetColumn];
    number = map[UserColumn().nameColumn];
    complement = map[UserColumn().complementColumn];
    city = map[UserColumn().cityColumn];
    state = map[UserColumn().stateColumn];

  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      UserColumn().nameColumn: name,
      UserColumn().emailColumn: email,
      UserColumn().phoneColumn: phone,
      UserColumn().streetColumn: street,
      UserColumn().nameColumn: name,
      UserColumn().complementColumn: complement,
      UserColumn().cityColumn: city,
      UserColumn().stateColumn : state,

    };
    if (id != null) {
      map[UserColumn().idColumn] = id;
    }
    return map;
  }
}