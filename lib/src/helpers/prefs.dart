import 'package:get_storage/get_storage.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:maxkgapp/src/const/const.dart';
import 'package:maxkgapp/src/models/address.dart';
import 'package:maxkgapp/src/models/token.dart';

import '../models/phone.dart';
import '../models/child.dart';
import '../models/user.dart';
import '../models/profile.dart';

class PrefKeys {

}

class Prefs {

  static final _box = GetStorage();

  static final _isLogin = false.val(PrefsKeys.IS_LOGIN_KEY);
  static bool get isLogin => _isLogin.val;
  static set isLogin(val) => _isLogin.val = val;

  static final _token = ''.val(PrefsKeys.TOKEN);
  static Token get token => Token.fromString(_token.val);
  static set token(Token val) => _token.val = val.toString();

  static User get user => _user;
  static set user(val) => _user = val;
  static User _user = User(name: 'Станислав',
    phone: '0700707070',
    profile: Profile(birthDay: '22.12.1895', legEnt: true, city: 'Бишкек',
      children: [
        Child(gender: 'Мальчик', birthDate: '22 декабря 2005')
      ],
      phones: [
        Phone(number: '0700889980'),
      ],
      addresses: [
        Address(name: 'ул. Медерова, 8', active: true),
        Address(name: 'ул. Медерова, 8'),
      ],
      vehicles: {'car': true, 'bicycle': true},
      hobbies: {'sport': true, 'health': true, 'electronics': true},
      pets: {'dog': true, 'cat': true, 'horse': true},
    ),
  );

  static final _defaultCurrency = 'сом'.val('DEF_CURRENCY');
  static get defaultCurrency => _defaultCurrency.val;
  static set defaultCurrency(val) => _defaultCurrency.val = val;

  static final _currencyRight = false.val('CURRENCY_RIGHT');
  static get currencyRight => _currencyRight.val;
  static set currencyRight(val) => _currencyRight.val = val;

  static final _firstTime = true.val('FIRST_TIME');
  static get firstTime => _firstTime.val;
  static set firstTime(val) => _firstTime.val = val;


  static final _selectedLang = "ru".val('SELECTED_LANG');
  static get selectedLang => _selectedLang.val;
  static set selectedLang(val) => _selectedLang.val = val;


  static final _isAddedToFavorite = false.val('ADDED_FAVORIDE');
  static get isAddedToFavorite => _isAddedToFavorite.val;
  static set isAddedToFavorite(val) => _isAddedToFavorite.val = val;

  static listenKey(key, Function(dynamic val) callBack) {
    return _box.listenKey(key, callBack);
  }

  static removeListener(listener) { }
}
