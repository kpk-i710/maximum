import 'child.dart';
import 'address.dart';
import 'phone.dart';
import 'app_model.dart';

class Profile extends AppModel {
  String? birthDay;
  String? gender;
  String? email;
  bool? legEnt;
  String? workPlace;
  String? jobPosition;
  String? city;
  List<Child>? children;
  List<Phone>? phones;
  List<Address>? addresses;
  Map<String, bool>? vehicles;
  Map<String, bool>? hobbies;
  Map<String, bool>? pets;

  Profile({this.birthDay, this.gender, this.email, this.legEnt, this.workPlace,
    this.jobPosition, this.city, this.children, this.phones, this.addresses,
    this.vehicles, this.hobbies, this.pets});

  copyWith({bool? legEnt}) => Profile(
    legEnt: legEnt ?? this.legEnt,
  );

  changeHasVehicle(String key, bool? val) {
    if (vehicles != null) vehicles![key] = val ?? false;
    return this;
  }

  changeHasHobby(String key, bool? val) {
    if (hobbies != null) hobbies![key] = val ?? false;
    return this;
  }

  changeHasPets(String key, bool? val) {
    if (pets != null) pets![key] = val ?? false;
    return this;
  }
}