import 'package:evently/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Authentication {
  static String? emailValidation(BuildContext context,String? email) {
    if (email == null || email.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterEmail;
    } else if (!RegExp(
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])',
    ).hasMatch(email)) {
      return AppLocalizations.of(context)!.invalidEmail;
    } else {
      return null;
    }
  }

  static String? passwordValidation(BuildContext context,String? password) {
    if (password == null || password.isEmpty) {
      return AppLocalizations.of(context)!.pleaseEnterPassword;
    } else if (!RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    ).hasMatch(password)) {
      return AppLocalizations.of(context)!.invalidPassword;
    } else {
      return null;
    }
  }

  static String? usernameValidation(BuildContext context,String? username){
    if(username==null||username.isEmpty){
      return AppLocalizations.of(context)!.pleaseEnterUserName;
    }
    else if(!RegExp(r"^\s*([A-Za-z]{3,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$").hasMatch(username)){
      return AppLocalizations.of(context)!.invalidUserName;
    }
    else{
      return null;
    }
  }
}
