import 'package:flutter/material.dart';

class AfterOnboardingProvider extends ChangeNotifier {
  bool flagRoute = false;

  AfterOnboardingProvider({bool initialValue = false}) {
    flagRoute = initialValue;
  }
}