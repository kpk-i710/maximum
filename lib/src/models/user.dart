import 'profile.dart';
import 'app_model.dart';

class User extends AppModel {
  int id;
  String? name;
  String? phone;
  Profile? profile;

  User({this.id = -1, this.name, this.phone, this.profile});
}
