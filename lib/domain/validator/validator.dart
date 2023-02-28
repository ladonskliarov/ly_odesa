abstract class Validator {
  String? validateEmailFiled(String? value);
  String? validatePasswordField(String? value);
  String? validateFullNameField(String? value);
  String? validatePhoneNumberField(String? value);
  String? validateCityField(String? value);
  String? validatePostField(String? value);
}

class ValidatorRealization implements Validator {

  @override
  validateEmailFiled(String? value) {
    if(value != null && value.isEmpty){
      return 'Заповніть це поле';
    } else if (
      value?.endsWith('@gmail.com') == false
      && value?.endsWith('@ukr.net') == false
      && value?.endsWith('@yahoo.com') == false
    ) {
      return 'Введіть коректний email';
    } else if (checkEmailName(value!)) {
      return 'Вам потрібно бути тестувальником';
    } else if (checkDogSymbolRepeat(value) == true) {
      return 'Забагато собачок';
    }

    return null;
  }

  @override
  validateFullNameField(String? value) {
    if(value != null && value.isEmpty){
      return 'Заповніть це поле';
    } else if (value?.contains(' ') == false) {
      return "Введіть ім'я та прізвище";
    }

    return null;
  }

  @override
  String? validatePhoneNumberField(String? value) {
    if(value != null && value.isEmpty){
      return 'Заповніть це поле';
    } else if (checkNumberOnPrefix(value!)) {
      return 'Введіть дійсний номер';
    }

    return null;
  }

  @override
  validatePasswordField(String? value) {
    if(value != null && value.isEmpty){
      return 'Заповніть це поле';
    } else if (value!.length < 8) {
      return "Введіть пароль від 8 символів";
    }

    print(value.length);
    return null;
  }

  @override
  String? validateCityField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Заповніть це поле';
    }

    return null;
  }

  @override
  String? validatePostField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Заповніть це поле';
    }

    return null;
  }

  ///FUNCTION CHECKERS FOR FIELDS///
  bool checkDogSymbolRepeat(String value) {
    int _check = 0;
    for (int i = 0; i < value.length; i++) {
      if (_check == 2) {
        return true;
      } else if (value[i] == '@') {
        _check += 1;
      }
    }

    return false;
  }

  bool checkEmailName(String value){
    final _value = value.split('');
    _value.remove('');
    if(_value.length < 2){
      return true;
    } else if (_value.first.length < 5) {
      return true;
    }
    
    return false;
  }

  checkNumberOnPrefix(String value){
    if(value.startsWith('+38')) {
      if(value.length != 11){
        return true;
      }
    } else if (value.startsWith('38')) {
        if(value.length != 10){
          return true;
      }
    } else {
      if(value.length != 7){
        return true;
      }
    }

    return false;
  }

}
